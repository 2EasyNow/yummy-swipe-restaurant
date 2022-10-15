import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_input/chips_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_food_delivery/app/common/widgets/dialogs.dart';
import 'package:intelligent_food_delivery/app/common/widgets/food_item_card.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/data/food_category/models/food_category.dart';
import 'package:intelligent_food_delivery/app/domain/food_category/use_cases/food_category_use_case.dart';
import 'package:sizer/sizer.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_theme.dart';
import '../../../common/widgets/bottom_sheets.dart';
import '../../../common/widgets/spacers.dart';
import '../controllers/food_controller.dart';

class FoodView extends GetView<FoodController> {
  const FoodView({super.key});

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
                  'Manage Food Items',
                  style: AppTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingSymmetric(vertical: 12, horizontal: 16),
              ],
            ),
            Expanded(
              child: GetBuilder<FoodController>(builder: (_) {
                return controller.allFoodItems.isNotEmpty
                    ? ListView.separated(
                        itemCount: controller.allFoodItems.length,
                        itemBuilder: (context, index) {
                          return FoodItemCard(
                            key: ValueKey(controller.allFoodItems[index].id + controller.allFoodItems[index].data!.name),
                            item: controller.allFoodItems[index],
                            isModdifyAble: true,
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
                          'No Food Item Found',
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
          Get.generalDialog(
            barrierDismissible: true,
            barrierLabel: 'Add Food Item',
            pageBuilder: (context, animation, secondaryAnimation) {
              return _AddItemView();
            },
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

class _AddItemView extends GetWidget<FoodController> {
  _AddItemView();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  File? _image;
  final List<String> _categories = [], _tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const BackButton(),
                  Text(
                    "Add Food Item",
                    style: AppTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // / / /   Name Field / / / //
                        Text(
                          'Name',
                          style: AppTextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const VerticalSpacer(space: 8),
                        TextFormField(
                          controller: _nameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        const VerticalSpacer(space: 8),
                        // / / /   Price Field / / / //
                        Text(
                          'Price',
                          style: AppTextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const VerticalSpacer(space: 8),
                        TextFormField(
                          controller: _priceController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            prefix: Text(
                              'RS. ',
                              style: AppTextStyle(color: Colors.black),
                            ),
                          ),
                          validator: (val) {
                            // try to check price must not be less than 0 or 0
                            if (val!.isEmpty) {
                              return 'Price is required';
                            }
                            final price = int.tryParse(val);
                            if (price == null) {
                              return 'Price must be a number';
                            }
                            if (price <= 0) {
                              return 'Price must be greater than 0';
                            }
                            return null;
                          },
                        ),
                        const VerticalSpacer(space: 8),
                        // / / /   Description Field / / / //
                        Text(
                          'Description',
                          style: AppTextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const VerticalSpacer(space: 8),
                        TextFormField(
                          controller: _descController,
                          minLines: 1,
                          maxLines: 4,
                          validator: (val) {
                            // try to check price must not be less than 0 or 0
                            if (val!.isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                        const VerticalSpacer(space: 8),
                        // / / /   Food Category Field / / / //
                        Text(
                          'Category',
                          style: AppTextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const VerticalSpacer(space: 8),
                        FutureBuilder<List<FoodCategoryDocumentSnapshot>>(
                            future: Get.find<FoodCategoryUseCase>().getAllResturantCategories(
                              resturantOwnerId: FirebaseAuth.instance.currentUser!.uid,
                            ),
                            builder: (context, snap) {
                              if (!snap.hasData) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              final initialValue = snap.data!.where((element) => _categories.contains(element.id)).toList();
                              return ChipsInput<FoodCategoryDocumentSnapshot>(
                                initialValue: initialValue,
                                findSuggestions: (String query) {
                                  if (query.isNotEmpty) {
                                    var lowercaseQuery = query.toLowerCase();
                                    final results = snap.data!.where((category) {
                                      return category.data!.name.contains(query.toLowerCase());
                                    }).toList(growable: false)
                                      ..sort((a, b) => a.data!.name
                                          .toLowerCase()
                                          .indexOf(lowercaseQuery)
                                          .compareTo(b.data!.name.toLowerCase().indexOf(lowercaseQuery)));
                                    return results;
                                  }
                                  return snap.data!;
                                },
                                onChanged: (data) {
                                  _categories.clear();
                                  _categories.addAll(data.map((e) => e.id));
                                },
                                chipBuilder: (context, state, category) {
                                  return InputChip(
                                    key: ObjectKey(category),
                                    label: Text(category.data!.name),
                                    onDeleted: () => state.deleteChip(category),
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  );
                                },
                                suggestionBuilder: (context, category) {
                                  return ListTile(
                                    key: ObjectKey(category),
                                    title: Text(category.data!.name),
                                  );
                                },
                              );
                            }),
                        const VerticalSpacer(space: 8),
                        // / / /   Tags Field / / / //
                        Text(
                          'Tags',
                          style: AppTextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const VerticalSpacer(space: 8),
                        ChipsInput<String>(
                          initialValue: _tags,
                          findSuggestions: (String query) {
                            if (query.isNotEmpty) {
                              var lowercaseQuery = query.toLowerCase();
                              final results = controller.tags.where((tag) {
                                return tag.contains(query.toLowerCase());
                              }).toList(growable: false)
                                ..sort((a, b) => a.toLowerCase().indexOf(lowercaseQuery).compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
                              return results;
                            }
                            return controller.tags;
                          },
                          onChanged: (data) {
                            _tags.clear();
                            _tags.addAll(data);
                          },
                          chipBuilder: (context, state, tag) {
                            return InputChip(
                              key: ObjectKey(tag),
                              label: Text(tag),
                              onDeleted: () => state.deleteChip(tag),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            );
                          },
                          suggestionBuilder: (context, tag) {
                            return ListTile(
                              key: ObjectKey(tag),
                              title: Text(tag),
                            );
                          },
                        ),
                        const VerticalSpacer(space: 8),
                        // ImagePicker
                        Text(
                          'Image',
                          style: AppTextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const VerticalSpacer(space: 8),
                        Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ValueBuilder<File?>(
                            initialValue: _image,
                            builder: (snapshot, updater) {
                              return GestureDetector(
                                onTap: () async {
                                  await _imagePicker(context);
                                  updater(_image);
                                },
                                child: getImageWidget(snapshot),
                              );
                            },
                          ),
                        ),
                        const VerticalSpacer(),
                        TextButton.icon(
                          icon: const Icon(Icons.add),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_image == null) {
                                showErrorSnackbar('Image', "Image is required");
                                return;
                              }
                              showLoadingBottomSheet(context, title: 'Adding...');
                              await controller.addFoodItem(
                                name: _nameController.text,
                                description: _descController.text,
                                price: int.parse(_priceController.text),
                                categories: _categories,
                                tags: _tags,
                                image: _image!,
                              );
                              if (Get.isBottomSheetOpen ?? false) {
                                Get.back();
                              }
                              if (Get.isDialogOpen ?? false) {
                                Get.back();
                              }
                              showSuccessSnackbar('Add Food', 'Food Item Added Successfully');
                            }
                          },
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ).paddingSymmetric(horizontal: 16),
              ),
            ],
          ).paddingSymmetric(vertical: 4),
        ),
      ),
    );
  }

  getImageWidget(File? image) {
    if (image == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.image_rounded,
              color: Colors.grey.shade400,
            ),
            Text(
              'No Image Selected',
              textAlign: TextAlign.center,
              style: AppTextStyle(
                fontSize: 9.sp,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      );
    }
    return Image.file(
      image,
      fit: BoxFit.cover,
    );
  }

  // show a dialog to select image from camera or gallery
  Future _imagePicker(context) async {
    FocusScope.of(context).unfocus();
    return showAppDialog(
      context,
      title: 'Image Source',
      icon: Icon(Icons.image),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.camera);
              if (image != null) {
                _image = File(image.path);
                Get.back();
              }
            },
            label: const Text('Camera'),
          ),
          const VerticalSpacer(space: 8),
          TextButton.icon(
            icon: const Icon(Icons.image),
            onPressed: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) {
                _image = File(image.path);
                Get.back();
              }
            },
            label: const Text('Gallery'),
          ),
        ],
      ),
    );
  }
}

