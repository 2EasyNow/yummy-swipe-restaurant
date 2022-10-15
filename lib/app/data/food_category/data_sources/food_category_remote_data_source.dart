
import '../models/food_category.dart';
import 'food_category_data_source.dart';

class FoodCategoryRemoteDataSource implements FoodCategoryDataSource {
  @override
  Future<void> createFoodCategory(FoodCategory category) async {
    await foodCategoriesReference.add(category);
  }

  @override
  Future<List<FoodCategoryDocumentSnapshot>> getCategoriesByResturant(String resturantId) async {
    final allCategoriesSnapshot = await foodCategoriesReference.whereResturantOwnerId(isEqualTo: resturantId).get();
    return allCategoriesSnapshot.docs;
  }

  @override
  Future<FoodCategory?> getFoodCategory(String categoryId) async {
    final category = await foodCategoriesReference.doc(categoryId).get();
    return category.data;
  }

  @override
  Future<FoodCategory> updateCategory(String uid, FoodCategory newCategory) async {
    await foodCategoriesReference.doc(uid).set(newCategory);
    return newCategory;
  }
  
  @override
  Future<void> deleteCategory(String categoryId) {
    return foodCategoriesReference.doc(categoryId).delete();
  }
}
