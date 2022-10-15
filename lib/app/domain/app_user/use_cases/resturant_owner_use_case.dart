import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/not_logged_in.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/user_not_found.dart';

import '../../../data/resturant_owner/models/resturant_owner.dart';
import '../repositories/resturant_owner_repository.dart';

class ResturantOwnerUseCase {
  final ResturantOwnerRepository _resturantOwnerRepository;

  ResturantOwnerUseCase(this._resturantOwnerRepository);

  Future<ResturantOwner> getCurrentLoggedInUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _resturantOwnerRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');
    return user;
  }

  Future<ResturantOwner> createResturantOwner({
    required String name,
    required String resturantName,
    required String phone,
    required String address,
    required LatLng coordinates,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = ResturantOwner(
      name: name,
      resturantName: resturantName,
      phone: phone,
      address: address,
      active: true,
      coordinates: coordinates,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return await _resturantOwnerRepository.createUser(user);
  }

  /// Check wether the current Logged in owner record
  /// is already created in FireStore or not
  /// if in case user is not LoggedIn then it will throw
  /// [NotLoggedInException] exception
  /// other wise it will return [bool]
  Future<bool> isUserRecordAdded() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _resturantOwnerRepository.getUser(uid);
    return user != null;
  }

  Future<ResturantOwner> updateOwner({
    required String name,
    required String resturantName,
    required String phone,
    required String address,
    required LatLng coordinates,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _resturantOwnerRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');

    final updatedUser = user.copyWith(
      name: name,
      resturantName: resturantName,
      phone: phone,
      address: address,
      coordinates: coordinates,
      updatedAt: DateTime.now(),
    );
    return await _resturantOwnerRepository.updateUser(uid, updatedUser);
  }


  /// Check if the user with 
  /// [phoneNumber] is already registered or not
  Future<bool> isOwnerRegistered(String phoneNumber) async {
    final user = await _resturantOwnerRepository.getUserByPhoneNumber(phoneNumber);
    return user != null;
  }

}
