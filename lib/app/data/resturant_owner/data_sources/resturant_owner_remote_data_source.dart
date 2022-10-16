import 'package:firebase_auth/firebase_auth.dart';
import 'package:intelligent_food_delivery/app/data/resturant_owner/data_sources/resturant_owner_data_source.dart';

import '../models/resturant_owner.dart';

class ResturantOwnerRemoteDataSource implements ResturantOwnerDataSource {
  @override
  Future<void> createResturantOwner(ResturantOwner user) async {
    userRef.doc(FirebaseAuth.instance.currentUser!.uid).set(user);
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
    await userRef.doc(uid).set(user);
    return user;
  }
}
