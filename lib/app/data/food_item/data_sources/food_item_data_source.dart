import 'dart:io';

import '../models/food_item.dart';

abstract class FoodItemDataSource {
  Future<void> createFoodItem(FoodItem item);
  Future<FoodItem?> getFoodItem(String foodItemId);
  Future<List<FoodItemDocumentSnapshot>> getItemsByResturant(String resturantId);
  Future<List<FoodItemDocumentSnapshot>> getItemsOfResturantByCategory(String resturantId);
  Future<FoodItem> update(String uid, FoodItem newFoodItem);
  Future<void> delete(String foodItemId);
  Future<String> uploadItemImage(File image, String itemId);
}
