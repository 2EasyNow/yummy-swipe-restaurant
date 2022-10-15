import '../../../data/resturant_owner/models/resturant_owner.dart';

abstract class ResturantOwnerRepository {
  Future<ResturantOwner?> getUser(String uid);
  Future<ResturantOwner> createUser(ResturantOwner user);
  Future<ResturantOwner> updateUser(String uid, ResturantOwner user);
  Future<ResturantOwner?> getUserByPhoneNumber(String phoneNumber);
}
