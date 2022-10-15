import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/food_category/models/food_category.dart';
import 'package:intelligent_food_delivery/app/data/food_item/models/food_item.dart';
import 'package:intelligent_food_delivery/app/domain/food_item/use_cases/food_item_use_case.dart';

class CategoryFoodListController extends GetxController {
  late final FoodCategoryDocumentSnapshot category;
  List<FoodItemDocumentSnapshot>? foodItems;

  // assign from the argument
  @override
  void onInit() {
    super.onInit();
    category = Get.arguments as FoodCategoryDocumentSnapshot;
    getFoodItems();
  }

  getFoodItems() {
    final useCase = Get.find<FoodItemUseCase>();
    useCase.getAllFoodItemsByCategory(categoryId: category.id).then((value) {
      foodItems = value;
      update();
    });
  }
}
