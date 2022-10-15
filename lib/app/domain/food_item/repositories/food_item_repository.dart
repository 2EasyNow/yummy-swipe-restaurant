

import 'dart:io';

import '../../../data/food_item/models/food_item.dart';

abstract class FoodItemRepository {
  Future<FoodItem?> getItem(String id);
  Future<FoodItem> createItem(FoodItem item);
  Future<FoodItem> updateItem(String id, FoodItem item);
  Future<List<FoodItemDocumentSnapshot>> getResturantItems(String resturantId);
  Future<List<FoodItemDocumentSnapshot>> getResturantItemsByCategory(String categoryId);
  Future<String> uploadItemImage(File image, String itemId);
  Future<void> deleteItem(String id);
}
