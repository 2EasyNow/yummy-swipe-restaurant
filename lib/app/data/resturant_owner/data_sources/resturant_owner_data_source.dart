import '../models/resturant_owner.dart';

abstract class ResturantOwnerDataSource {
  Future<void> createResturantOwner(ResturantOwner user);
  Future<ResturantOwner?> getResturantOwner(String uid);
  Future<ResturantOwner?> getOwnerByPhoneNumber(String phone);
  Future<ResturantOwner> updateOwner(String uid, ResturantOwner user);
}
