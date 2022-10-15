import 'dart:io';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/utils/random.dart';
import 'package:intelligent_food_delivery/app/domain/food_category/use_cases/food_category_use_case.dart';

import '../../../data/food_item/models/food_item.dart';
import '../repositories/food_item_repository.dart';

class FoodItemUseCase {
  final FoodItemRepository _repository;

  FoodItemUseCase(this._repository);

  Future<FoodItem> create({
    required String resturantOwnerId,
    required String name,
    required String description,
    required int price,
    required File image,
    List<String> categories = const [],
    List<String> tags = const [],
  }) async {
    final imageName = getRandomString(20);
    await _repository.uploadItemImage(
      image,
      imageName,
    );
    final item = FoodItem(
      resturantOwnerId: resturantOwnerId,
      name: name,
      description: description,
      price: price,
      imageName: imageName,
      categories: categories,
      tags: tags,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
      final categoryUseCase = Get.find<FoodCategoryUseCase>();

      for (var element in categories) {
        categoryUseCase.incrementTotalFoodItems(categoryId: element);
      }
    
    return await _repository.createItem(item);
  }

  Future<FoodItem> updateItem({
    required FoodItemDocumentSnapshot oldItem,
    String? name,
    String? description,
    String? imageUrl,
    int? price,
    List<String>? categories,
    List<String>? tags,
    bool? active,
  }) async {
    if (categories != null) {
      final needIncrementCategory = categories.where((element) => !oldItem.data!.categories.contains(element)).toList();
      final needDecrementCategory = oldItem.data!.categories.where((element) => !categories.contains(element)).toList();
      final categoryUseCase = Get.find<FoodCategoryUseCase>();
      for (var element in needIncrementCategory) {
        await categoryUseCase.incrementTotalFoodItems(categoryId: element);
      }
      
      for (var element in needDecrementCategory) {
        await categoryUseCase.decrementTotalFoodItems(categoryId: element);
      }
    }
    final item = oldItem.data!.copyWith(
      name: name,
      description: description,
      imageName: imageUrl,
      price: price,
      categories: categories,
      tags: tags,
      active: active,
      updatedAt: DateTime.now(),
    );
    return await _repository.updateItem(oldItem.id, item);
  }

  Future<FoodItem> updateCategoryStatus({
    required FoodItemDocumentSnapshot item,
    required bool active,
  }) async {
    final category = item.data!.copyWith(
      active: active,
    );
    return _repository.updateItem(item.id, category);
  }

  Future<List<FoodItemDocumentSnapshot>> getAllFoodItems({
    required String resturantOwnerId,
  }) async {
    return _repository.getResturantItems(resturantOwnerId);
  }

  Future<List<FoodItemDocumentSnapshot>> getAllFoodItemsByCategory({
    required String categoryId,
  }) async {
    return _repository.getResturantItemsByCategory(categoryId);
  }

  Future<List<FoodItemDocumentSnapshot>> searchFoodItems({
    required List<FoodItemDocumentSnapshot> items,
    required String query,
  }) async {
    return items.where((element) => element.data!.name.contains(query)).toList();
  }

  Future<void> delete({
    required String id,
  }) async {
    return _repository.deleteItem(id);
  }
}
