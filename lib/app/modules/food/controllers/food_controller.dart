import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';

import '../../../common/widgets/snackbars.dart';
import '../../../data/food_item/models/food_item.dart';
import '../../../domain/food_item/use_cases/food_item_use_case.dart';

class FoodController extends GetxController {
  final List<FoodItem> allFoodItems = [];

  @override
  onInit() async {
    super.onInit();
    getAllFoodItems();
  }

  getAllFoodItems() async {
    FoodItemUseCase useCase = Get.find();
    final data = await useCase.getAllFoodItems(
      restaurantOwnerId: FirebaseAuth.instance.currentUser!.uid,
    );
    allFoodItems.clear();
    allFoodItems.addAll(data);
    update();
  }

  Future addFoodItem({
    required String name,
    required String description,
    required int price,
    required List<String> categories,
    required List<String> tags,
    required File image,
  }) async {
    FoodItemUseCase useCase = Get.find();
    final foodItem = await useCase.create(
      restaurantOwnerId: FirebaseAuth.instance.currentUser!.uid,
      name: name,
      description: description,
      price: price,
      image: image,
      categories: categories,
      tags: tags,
    );
    allFoodItems.add(foodItem);
    update();
  }

  Future deleteItem(FoodItem category) async {
    FoodItemUseCase useCase = Get.find();
    await useCase.delete(id: category.id);
    showSuccessSnackbar('Delete Category', "Category Deleted Successfully");
    final index = allFoodItems.indexWhere((element) => element.id == category.id);
    allFoodItems.removeAt(index);
    update();
  }

  updateItem({
    required String name,
    required String description,
    required int price,
    required List<String> categories,
    required List<String> tags,
    required FoodItem item,
    File? image,
  }) async {
    FoodItemUseCase useCase = Get.find();
    if (image != null) {
      await FirebaseUtils.uploadFileOnFirebaseStorage(image, item.imagePath);
    }
    final updatedItem = await useCase.updateItem(
      oldItem: item,
      name: name,
      description: description,
      price: price,
      tags: tags,
      categories: categories,
    );
    final index = allFoodItems.indexWhere((element) => element.id == item.id);
    allFoodItems[index] = updatedItem;
    update();
  }

  void pickImage() {}
}
