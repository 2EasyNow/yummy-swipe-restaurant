import 'dart:io';

import 'package:intelligent_food_delivery/app/data/food_item/models/food_item.dart';
import '../../../domain/food_item/repositories/food_item_repository.dart';
import '../data_sources/food_item_data_source.dart';

class FoodItemRepositoryImpl implements FoodItemRepository {
  final FoodItemDataSource _dataSource;

  FoodItemRepositoryImpl(this._dataSource);

  @override
  Future<FoodItem> createItem(FoodItem item) async {
    await _dataSource.createFoodItem(item);
    return item;
  }

  @override
  Future<List<FoodItemDocumentSnapshot>> getResturantItems(String resturantId) {
    return _dataSource.getItemsByResturant(resturantId);
  }
  
  @override
  Future<List<FoodItemDocumentSnapshot>> getResturantItemsByCategory(String categoryId) {
    return _dataSource.getItemsOfResturantByCategory(categoryId);
  }

  @override
  Future<FoodItem?> getItem(String id) {
    return _dataSource.getFoodItem(id);
  }

  @override
  Future<FoodItem> updateItem(String id, FoodItem category) {
    return _dataSource.update(id, category);
  }
  
  @override
  Future<void> deleteItem(String id) {
    return _dataSource.delete(id);
  }

  @override
  Future<String> uploadItemImage(File image, String itemId) {
    return _dataSource.uploadItemImage(image, itemId);
  }


}
