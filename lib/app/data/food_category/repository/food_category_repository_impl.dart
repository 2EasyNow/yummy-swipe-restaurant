import 'package:intelligent_food_delivery/app/data/food_category/data_sources/food_category_data_source.dart';
import 'package:intelligent_food_delivery/app/data/food_category/models/food_category.dart';

import '../../../domain/food_category/repositories/food_category_repository.dart';

class FoodCategoryRepositoryImpl implements FoodCategoryRepository {
  final FoodCategoryDataSource _dataSource;

  FoodCategoryRepositoryImpl(this._dataSource);

  @override
  Future<FoodCategory> createCategory(FoodCategory category) async {
    await _dataSource.createFoodCategory(category);
    return category;
  }

  @override
  Future<List<FoodCategoryDocumentSnapshot>> getAllResturantCategories(String resturantId) {
    return _dataSource.getCategoriesByResturant(resturantId);
  }

  @override
  Future<FoodCategory?> getCategory(String categoryId) {
    return _dataSource.getFoodCategory(categoryId);
  }

  @override
  Future<FoodCategory> updateCategory(String uid, FoodCategory category) {
    return _dataSource.updateCategory(uid, category);
  }
  
  @override
  Future<void> deleteCategory(String categoryId) {
    return _dataSource.deleteCategory(categoryId);
  }

}
