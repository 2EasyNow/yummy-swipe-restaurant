import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/common/widgets/bottom_sheets.dart';
import 'package:intelligent_food_delivery/app/common/widgets/confirmation_dialog.dart';
import 'package:intelligent_food_delivery/app/common/widgets/spacers.dart';
import 'package:sizer/sizer.dart';

import '../../../data/food_category/models/food_category.dart';
import '../../../routes/app_pages.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const BackButton(),
                Text(
                  'Manage Categories',
                  style: AppTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingSymmetric(vertical: 12, horizontal: 16),
              ],
            ),
            Expanded(
              child: GetBuilder<CategoriesController>(builder: (_) {
                return controller.allCategories.isNotEmpty
                    ? ListView.separated(
                        itemCount: controller.allCategories.length,
                        itemBuilder: (context, index) {
                          final category = controller.allCategories[index]; 
                          return _FoodCategoryCard(
                            key: ValueKey(
                              category.id + category.name,
                            ),
                            category: category,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 8,
                          );
                        },
                      ).paddingSymmetric(horizontal: 12)
                    : Center(
                        child: Text(
                          'No Categories Found',
                          style: AppTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors(context).primary,
        onPressed: () {
          showAppGeneralBottomSheet(
            context,
            title: 'Add Category',
            body: _AddCategoryView(),
          );
        },
        child: Icon(
          Icons.add,
          color: AppColors(context).onPrimary,
        ),
      ),
    );
  }
}

class _FoodCategoryCard extends GetWidget<CategoriesController> {
  const _FoodCategoryCard({required this.category, required super.key});

  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    // contains name, edit and delete button also the add food button
    return Card(
      // color: AppColors(context).background,
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          Get.toNamed(
            '${Routes.CATEGORIES}${Routes.CATEGORY_FOOD_LIST}',
            arguments: category,
          );
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: AppTextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${category.totalFoodItems} Foods Items',
                      style: AppTextStyle(
                        fontSize: 9.sp,
                        color: AppColors(context).isDark ? AppColors(context).primary : AppColors(context).primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showAppGeneralBottomSheet(
                        context,
                        title: 'Edit Category',
                        body: _UpdateCategoryView(
                          category: category,
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      ConfirmationDialog(
                        title: 'Delete Category',
                        message: 'Are you sure you want to delete this category?',
                        confirmButtonText: 'Delete',
                        confirmButtonColor: AppColors(context).error,
                        cancelButtonColor: AppColors(context).white,
                        onConfirm: () => controller.deleteCategory(category),
                        onCancel: () {},
                      ).show(context);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 12),
        ),
      ),
    );
  }
}

class _AddCategoryView extends GetWidget<CategoriesController> {
  _AddCategoryView();

  final _formKey = GlobalKey<FormState>();
  final _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Category Name',
                style: AppTextStyle(
                  color: Colors.grey.shade400,
                ),
              )
            ],
          ),
          const VerticalSpacer(space: 8),
          TextFormField(
            controller: _categoryNameController,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Category Name is required';
              }
              return null;
            },
          ),
          const VerticalSpacer(),
          TextButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                controller.createCategory(_categoryNameController.text);
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
              }
            },
            label: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _UpdateCategoryView extends GetWidget<CategoriesController> {
  _UpdateCategoryView({
    required this.category,
  }) : _categoryNameController = TextEditingController(text: category.name);

  final FoodCategory category;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _categoryNameController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Category Name',
                style: AppTextStyle(
                  color: Colors.grey.shade400,
                ),
              )
            ],
          ),
          const VerticalSpacer(space: 8),
          TextFormField(
            controller: _categoryNameController,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Category Name is required';
              }
              return null;
            },
          ),
          const VerticalSpacer(),
          TextButton.icon(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                controller.updateCategory(category, _categoryNameController.text);
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
              }
            },
            label: const Text('Update'),
            icon: const Icon(Icons.update),
          ),
        ],
      ),
    );
  }
}
