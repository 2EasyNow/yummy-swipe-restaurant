import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/not_logged_in.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/user_not_found.dart';

import '../../../data/resturant_owner/models/resturant_owner.dart';
import '../repositories/resturant_owner_repository.dart';

class ResturantOwnerUseCase {
  final ResturantOwnerRepository _resturantOwnerRepository;
  ResturantOwner? _currentUser;

  ResturantOwnerUseCase(this._resturantOwnerRepository) {
    if (FirebaseAuth.instance.currentUser != null) {
      getCurrentLoggedInUser().then((value) => _currentUser = value);
    }
  }

  ResturantOwner? get currentUser => _currentUser;

  Future<ResturantOwner> getCurrentLoggedInUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _resturantOwnerRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');
    return user;
  }

  Future<ResturantOwner?> refreshCurrentuser() async {
    _currentUser = await getCurrentLoggedInUser();
    return _currentUser;
  }

  Future<ResturantOwner> createResturantOwner({
    required String name,
    required String resturantName,
    required String phone,
    required String address,
    required File bannerImage,
    required LatLng coordinates,
    required List<String> resturantTags,
    required TimeOfDay openingTime,
    required TimeOfDay closingTime,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final bannerImagePath = 'resturants/$uid/banner';
    await FirebaseUtils.uploadFileOnFirebaseStorage(bannerImage, bannerImagePath);
    final user = ResturantOwner(
      name: name,
      resturantName: resturantName,
      phone: phone,
      address: address,
      active: true,
      coordinates: coordinates,
      bannerImagePath: bannerImagePath,
      resturantTags: resturantTags,
      openingTime: openingTime,
      closingTime: closingTime,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _currentUser = user;
    return await _resturantOwnerRepository.createUser(user);
  }

  /// Check wether the current Logged in owner record
  /// is already created in FireStore or not
  /// if in case user is not LoggedIn then it will throw
  /// [NotLoggedInException] exception
  /// other wise it will return [bool]
  Future<bool> isCurrentUserRecordAdded() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    _currentUser = await _resturantOwnerRepository.getUser(uid);
    print("Record Set");
    return _currentUser != null;
  }

  Future<ResturantOwner> updateOwner({
    required String name,
    required String resturantName,
    required String phone,
    required String address,
    required LatLng coordinates,
    required List<String> resturantTags,
    required TimeOfDay openingTime,
    required TimeOfDay closingTime,
    File? bannerImage,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _resturantOwnerRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');

    if (bannerImage != null) {
      final bannerImagePath = 'resturants/$uid/banner';
      await FirebaseUtils.uploadFileOnFirebaseStorage(bannerImage, bannerImagePath);
    }

    final updatedUser = user.copyWith(
      name: name,
      resturantName: resturantName,
      phone: phone,
      address: address,
      coordinates: coordinates,
      resturantTags: resturantTags,
      openingTime: openingTime,
      closingTime: closingTime,
      bannerImagePath: bannerImage != null ? 'resturants/$uid/banner' : user.bannerImagePath,
      updatedAt: DateTime.now(),
    );
    _currentUser = updatedUser;
    return await _resturantOwnerRepository.updateUser(uid, updatedUser);
  }

  /// Check if the user with
  /// [phoneNumber] is already registered or not
  Future<bool> isOwnerRegistered(String phoneNumber) async {
    final user = await _resturantOwnerRepository.getUserByPhoneNumber(phoneNumber);
    return user != null;
  }

  Future<ResturantOwner> updateBannerImage(File file) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');
    return updateOwner(
      name: _currentUser!.name,
      resturantName: _currentUser!.resturantName,
      phone: _currentUser!.phone,
      address: _currentUser!.address,
      coordinates: _currentUser!.coordinates,
      resturantTags: _currentUser!.resturantTags,
      openingTime: _currentUser!.openingTime,
      closingTime: _currentUser!.closingTime,
      bannerImage: file,
    );
  }
}
