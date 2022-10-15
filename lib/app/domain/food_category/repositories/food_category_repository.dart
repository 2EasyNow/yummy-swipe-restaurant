

import '../../../data/food_category/models/food_category.dart';

abstract class FoodCategoryRepository {
  Future<FoodCategory?> getCategory(String categoryId);
  Future<FoodCategory> createCategory(FoodCategory category);
  Future<FoodCategory> updateCategory(String uid, FoodCategory category);
  Future<List<FoodCategoryDocumentSnapshot>> getAllResturantCategories(String resturantId);
  Future<void> deleteCategory(String categoryId);
}
