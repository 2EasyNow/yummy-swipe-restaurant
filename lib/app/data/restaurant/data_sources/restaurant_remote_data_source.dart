import 'package:firebase_auth/firebase_auth.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/data_sources/restaurant_data_source.dart';

import '../models/restaurant.dart';

class RestaurantRemoteDataSource implements RestaurantDataSource {
  @override
  Future<void> createRestaurant(Restaurant user) async {
    userRef.doc(FirebaseAuth.instance.currentUser!.uid).set(user);
    // userRef.add(user.copyWith(
    //   id: FirebaseAuth.instance.currentUser!.uid,
    // ));
  }

  @override
  Future<Restaurant?> getRestaurant(String uid) async {
    final user = await userRef.doc(uid).get();
    return user.data;
  }

  @override
  Future<Restaurant?> getRestaurantByPhoneNumber(String phone) async {
    final user = await userRef.wherePhone(isEqualTo: phone).get();
    return user.docs.isNotEmpty ? user.docs.first.data : null;
  }

  @override
  Future<Restaurant> update(Restaurant user) async {
    await userRef.doc(user.id).set(user);
    return user;
  }
}
