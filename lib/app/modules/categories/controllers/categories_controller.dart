import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/data/food_category/models/food_category.dart';
import 'package:intelligent_food_delivery/app/domain/food_category/use_cases/food_category_use_case.dart';

class CategoriesController extends GetxController {
  final List<FoodCategoryDocumentSnapshot> allCategories = [];

  @override
  onInit() async {
    super.onInit();
    refreshCategoriesList();
  }

  refreshCategoriesList() async {
    FoodCategoryUseCase useCase = Get.find();
    final data = await useCase.getAllResturantCategories(
      resturantOwnerId: FirebaseAuth.instance.currentUser!.uid,
    );
    allCategories.clear();
    allCategories.addAll(data);
    update();
  }

  Future createCategory(String name) async {
    FoodCategoryUseCase useCase = Get.find();
    await useCase.createCategory(
      name: name,
      resturantOwnerId: FirebaseAuth.instance.currentUser!.uid,
    );
    showSuccessSnackbar('Create Category', "Category Created Successfully");
    refreshCategoriesList();
  }

  void deleteCategory(FoodCategoryDocumentSnapshot category) async {
    FoodCategoryUseCase useCase = Get.find();
    await useCase.deleteCategory(categoryId: category.id);
    showSuccessSnackbar('Delete Category', "Category Deleted Successfully");
    refreshCategoriesList();
  }

  Future updateCategory(FoodCategoryDocumentSnapshot category, String text) async {
    FoodCategoryUseCase useCase = Get.find();
    await useCase.updateCategory(
      oldCategory: category,
      name: text,
    );
    showSuccessSnackbar('Update Category', "Category Updated Successfully");
    refreshCategoriesList();
  }
}
