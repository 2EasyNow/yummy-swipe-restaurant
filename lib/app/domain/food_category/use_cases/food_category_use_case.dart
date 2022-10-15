import '../../../data/food_category/models/food_category.dart';
import '../repositories/food_category_repository.dart';

class FoodCategoryUseCase {
  final FoodCategoryRepository _repository;

  FoodCategoryUseCase(this._repository);

  Future<FoodCategory> createCategory({
    required String name,
    required String resturantOwnerId,
  }) async {
    final category = FoodCategory(
      resturantOwnerId: resturantOwnerId,
      name: name,
      updatedAt: DateTime.now(),
      active: true,
    );
    return _repository.createCategory(category);
  }

  Future<FoodCategory> updateCategory({
    required FoodCategoryDocumentSnapshot oldCategory,
    String? name,
    bool? active,
  }) async {
    final category = oldCategory.data!.copyWith(
      name: name,
      active: active,
    );
    return _repository.updateCategory(oldCategory.id, category);
  }

  // update status of category
  Future<FoodCategory> updateCategoryStatus({
    required String categoryId,
    required FoodCategory oldCategory,
    required bool active,
  }) async {
    final category = oldCategory.copyWith(
      active: active,
    );
    return _repository.updateCategory(categoryId, category);
  }

  //get all Categories of a resturant
  Future<List<FoodCategoryDocumentSnapshot>> getAllResturantCategories({
    required String resturantOwnerId,
  }) async {
    return _repository.getAllResturantCategories(resturantOwnerId);
  }

  // get a single category
  Future<FoodCategory?> getCategory({
    required String categoryId,
  }) async {
    return _repository.getCategory(categoryId);
  }

  // update total food items
  Future<FoodCategory> _updateTotalFoodItems({
    required String categoryId,
    required FoodCategory oldCategory,
    required int totalFoodItems,
  }) async {
    final category = oldCategory.copyWith(
      totalFoodItems: totalFoodItems,
    );
    return _repository.updateCategory(categoryId, category);
  }

  // increment total food items
  Future<FoodCategory> incrementTotalFoodItems({
    required String categoryId,
  }) async {
    final oldCategory = await _repository.getCategory(categoryId);
    return _updateTotalFoodItems(
      categoryId: categoryId,
      oldCategory: oldCategory!,
      totalFoodItems: oldCategory.totalFoodItems + 1,
    );
  }

  // decrement total food items
  Future<FoodCategory> decrementTotalFoodItems({
    required String categoryId,
  }) async {
    final oldCategory = await _repository.getCategory(categoryId);
    return _updateTotalFoodItems(
      categoryId: categoryId,
      oldCategory: oldCategory!,
      totalFoodItems: oldCategory.totalFoodItems - 1,
    );
  }

  // delete a category
  Future<void> deleteCategory({
    required String categoryId,
  }) async {
    return _repository.deleteCategory(categoryId);
  }
}
