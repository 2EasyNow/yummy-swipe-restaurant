import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/not_logged_in.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/user_not_found.dart';

import '../../../data/restaurant/models/restaurant.dart';
import '../repositories/restaurant_repository.dart';

class RestaurantUseCase {
  final RestaurantRepository _restaurantOwnerRepository;
  Restaurant? _currentUser;

  RestaurantUseCase(this._restaurantOwnerRepository) {
    if (FirebaseAuth.instance.currentUser != null) {
      getCurrentLoggedInUser().then((value) => currentUser = value);
    }
  }

  Restaurant? get currentUser => _currentUser;
  set currentUser(Restaurant? user) {
    _currentUser = user;
    print('Current user is set to ${user}');
    addFCMTokenfIfNotExist();
  }

  Future<Restaurant> getCurrentLoggedInUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _restaurantOwnerRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');
    return user;
  }

  Future<Restaurant?> refreshCurrentuser() async {
    currentUser = await getCurrentLoggedInUser();
    return _currentUser;
  }

  Future<Restaurant> createRestaurant({
    required String ownerName,
    required String name,
    required String phone,
    required String address,
    required File bannerImage,
    required LatLng coordinates,
    required List<String> foodOfferingTypes,
    required TimeOfDay openingTime,
    required TimeOfDay closingTime,
    int averageTimeToCompleteOrder = 30,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final bannerImagePath = 'restaurants/$uid/banner';
    await FirebaseUtils.uploadFileOnFirebaseStorage(bannerImage, bannerImagePath);
    final user = Restaurant(
      
      ownerName: ownerName,
      name: name,
      phone: phone,
      address: address,
      active: true,
      coordinates: coordinates,
      bannerImagePath: bannerImagePath,
      foodOfferingTypes: foodOfferingTypes,
      openingTime: openingTime,
      closingTime: closingTime,
      averageTimeToCompleteOrder: averageTimeToCompleteOrder,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    currentUser = user;
    return await _restaurantOwnerRepository.createUser(user);
  }

  /// Check wether the current Logged in owner record
  /// is already created in FireStore or not
  /// if in case user is not LoggedIn then it will throw
  /// [NotLoggedInException] exception
  /// other wise it will return [bool]
  Future<bool> isCurrentUserRecordAdded() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    currentUser = await _restaurantOwnerRepository.getUser(uid);
    print("Record Set");
    return _currentUser != null;
  }

  Future<Restaurant> updateOwner({
    required String ownerName,
    required String name,
    required String phone,
    required String address,
    required LatLng coordinates,
    required List<String> foodOfferingTypes,
    required TimeOfDay openingTime,
    required TimeOfDay closingTime,
    File? bannerImage,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _restaurantOwnerRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');

    if (bannerImage != null) {
      final bannerImagePath = 'restaurants/$uid/banner';
      await FirebaseUtils.uploadFileOnFirebaseStorage(bannerImage, bannerImagePath);
    }

    final updatedUser = user.copyWith(
      name: name,
      ownerName: ownerName,
      phone: phone,
      address: address,
      coordinates: coordinates,
      foodOfferingTypes: foodOfferingTypes,
      openingTime: openingTime,
      closingTime: closingTime,
      bannerImagePath: bannerImage != null ? 'restaurants/$uid/banner' : user.bannerImagePath,
      updatedAt: DateTime.now(),
    );
    currentUser = updatedUser;
    return await _restaurantOwnerRepository.updateUser(updatedUser);
  }

  /// Check if the user with
  /// [phoneNumber] is already registered or not
  Future<bool> isOwnerRegistered(String phoneNumber) async {
    final user = await _restaurantOwnerRepository.getUserByPhoneNumber(phoneNumber);
    return user != null;
  }

  Future<Restaurant> updateBannerImage(File file) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');
    return updateOwner(
      ownerName: _currentUser!.ownerName,
      name: _currentUser!.name,
      phone: _currentUser!.phone,
      address: _currentUser!.address,
      coordinates: _currentUser!.coordinates,
      foodOfferingTypes: _currentUser!.foodOfferingTypes,
      openingTime: _currentUser!.openingTime,
      closingTime: _currentUser!.closingTime,
      bannerImage: file,
    );
  }

  addFCMTokenfIfNotExist() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null) return;
    if (!_currentUser!.fcmTokens.contains(token)) {
      addFCMToken(token);
    }
  }

  Future<Restaurant> addFCMToken(String token) async {
    final updatedUser = currentUser!.copyWith(fcmTokens: [...currentUser!.fcmTokens, token]);
    currentUser = await _restaurantOwnerRepository.updateUser(updatedUser);
    return currentUser!;
  }
}
