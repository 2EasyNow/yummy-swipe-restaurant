import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/common/widgets/bottom_sheets.dart';

import '../../../common/widgets/snackbars.dart';
import '../../../data/food_item/models/food_item.dart';
import '../../../domain/food_item/use_cases/food_item_use_case.dart';

class FoodController extends GetxController {
  final List<FoodItemDocumentSnapshot> allFoodItems = [];

  @override
  onInit() async {
    super.onInit();
    refreshFoodItemsList();
  }

  refreshFoodItemsList() async {
    FoodItemUseCase useCase = Get.find();
    final data = await useCase.getAllFoodItems(
      resturantOwnerId: FirebaseAuth.instance.currentUser!.uid,
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
    await useCase.create(
      resturantOwnerId: FirebaseAuth.instance.currentUser!.uid,
      name: name,
      description: description,
      price: price,
      image: image,
      categories: categories,
      tags: tags,
    );
    refreshFoodItemsList();
  }

  Future deleteItem(FoodItemDocumentSnapshot category) async {
    FoodItemUseCase useCase = Get.find();
    await useCase.delete(id: category.id);
    showSuccessSnackbar('Delete Category', "Category Deleted Successfully");
    refreshFoodItemsList();
  }

  updateItem({
    required String name,
    required String description,
    required int price,
    required List<String> categories,
    required List<String> tags,
    required FoodItemDocumentSnapshot item,
    File? image,
  }) async {
    FoodItemUseCase useCase = Get.find();
    if (image != null) {
      await FirebaseUtils.uploadFileOnFirebaseStorage(image, item.data!.imagePath);
    }
    await useCase.updateItem(
      oldItem: item,
      name: name,
      description: description,
      price: price,
      tags: tags,
      categories: categories,
    );
    refreshFoodItemsList();
  }

  void pickImage() {}
}
