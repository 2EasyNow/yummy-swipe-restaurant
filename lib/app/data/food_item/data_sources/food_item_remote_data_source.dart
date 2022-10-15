import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';

import '../models/food_item.dart';
import 'food_item_data_source.dart';

class FoodItemRemoteDataSource implements FoodItemDataSource {
  @override
  Future<void> createFoodItem(FoodItem item) async {
    await foodItemRef.add(item);
  }

  @override
  Future<List<FoodItemDocumentSnapshot>> getItemsByResturant(String resturantId) async {
    final data = await foodItemRef.whereResturantOwnerId(isEqualTo: resturantId).get();
    return data.docs;
  }

  @override
  Future<List<FoodItemDocumentSnapshot>> getItemsOfResturantByCategory(String categoryId) async {
    final data = await foodItemRef.whereCategories(arrayContains: categoryId).get();
    return data.docs;
  }

  @override
  Future<FoodItem?> getFoodItem(String categoryId) async {
    final category = await foodItemRef.doc(categoryId).get();
    return category.data;
  }

  @override
  Future<FoodItem> update(String uid, FoodItem newItem) async {
    await foodItemRef.doc(uid).set(newItem);
    return newItem;
  }

  @override
  Future<void> delete(String categoryId) {
    return foodItemRef.doc(categoryId).delete();
  }

  @override
  Future<String> uploadItemImage(File image, String itemId) {
    return FirebaseUtils.uploadFileOnFirebaseStorage(image, 'resturants/${FirebaseAuth.instance.currentUser!.uid}/$itemId');
  }
}
