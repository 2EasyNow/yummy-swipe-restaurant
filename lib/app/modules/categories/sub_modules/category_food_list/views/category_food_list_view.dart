import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/common/widgets/food_item_card.dart';

import '../controllers/category_food_list_controller.dart';

class CategoryFoodListView extends GetView<CategoryFoodListController> {
  const CategoryFoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CategoryFoodListController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BackButton(),
                  Text(
                    controller.category.data!.name,
                    style: AppTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingSymmetric(vertical: 12, horizontal: 16),
                ],
              ),
              if (controller.foodItems == null)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (controller.foodItems != null && controller.foodItems!.isEmpty)
                const Expanded(
                  child: Center(child: Text("No Food Items added in this category yet.")),
                ),
              if (controller.foodItems != null && controller.foodItems!.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.foodItems!.length,
                    itemBuilder: (context, index) {
                      return FoodItemCard(item: controller.foodItems![index]);
                    },
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
