import 'package:intelligent_food_delivery/app/data/resturant_owner/data_sources/resturant_owner_data_source.dart';

import '../models/resturant_owner.dart';

class ResturantOwnerRemoteDataSource implements ResturantOwnerDataSource {
  @override
  Future<void> createResturantOwner(ResturantOwner user) async {
    userRef.add(user);
  }

  @override
  Future<ResturantOwner?> getResturantOwner(String uid) async {
    final user = await userRef.doc(uid).get();
    return user.data;
  }

  @override
  Future<ResturantOwner?> getOwnerByPhoneNumber(String phone) async {
    final user = await userRef.wherePhone(isEqualTo: phone).get();
    return user.docs.isNotEmpty ? user.docs.first.data : null;
  }

  @override
  Future<ResturantOwner> updateOwner(String uid, ResturantOwner user) async {
    await userRef.doc(uid).update(
          name: user.name,
          resturantName: user.resturantName,
          phone: user.phone,
          address: user.address,
          updatedAt: DateTime.now(),
          active: user.active,
        );
    return user;
  }
}
