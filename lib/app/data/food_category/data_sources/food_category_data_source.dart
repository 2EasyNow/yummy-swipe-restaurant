
import '../models/food_category.dart';

abstract class FoodCategoryDataSource {
  Future<void> createFoodCategory(FoodCategory category);
  Future<FoodCategory?> getFoodCategory(String categoryId);
  Future<List<FoodCategoryDocumentSnapshot>> getCategoriesByResturant(String resturantId);
  Future<FoodCategory> updateCategory(String uid, FoodCategory newCategory);
  Future<void> deleteCategory(String categoryId);
}
