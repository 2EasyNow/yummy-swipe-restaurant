import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_input/chips_input.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/common/widgets/confirmation_dialog.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/domain/app_settings/usecase/app_setttings_use_case.dart';
import 'package:sizer/sizer.dart';

import '../../data/food_category/models/food_category.dart';
import '../../data/food_item/models/food_item.dart';
import '../../domain/food_category/use_cases/food_category_use_case.dart';
import '../../modules/food/controllers/food_controller.dart';
import '../theme/text_theme.dart';
import 'bottom_sheets.dart';
import 'dialogs.dart';
import 'spacers.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    Key? key,
    required this.item,
    this.isModdifyAble = false,
  }) : super(key: key);

  final FoodItem item;
  final bool isModdifyAble;

  @override
  Widget build(BuildContext context) {
    final FoodItem foodItem = item;
    return SizedBox.fromSize(
      size: Size.fromHeight(isModdifyAble ? 130 : 100),
      child: Card(
        elevation: 0.0,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: AppTextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    foodItem.description,
                    style: AppTextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Rs. ${foodItem.price}',
                        style: AppTextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      if (isModdifyAble)
                        IconButton(
                          onPressed: () {
                            Get.generalDialog(
                              barrierDismissible: true,
                              barrierLabel: 'Food Item',
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return _UpdateItemView(
                                  item: item,
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      if (isModdifyAble)
                        IconButton(
                          onPressed: () {
                            ConfirmationDialog(
                              title: 'Delete Item',
                              message: 'Are you sure you want to delete this food item?',
                              confirmButtonColor: Colors.red,
                              cancelButtonColor: AppColors(context).inverseBackground,
                              confirmButtonText: 'Delete',
                              onConfirm: () async {
                                await FirebaseUtils.deleteFile(foodItem.imagePath);
                                await Get.find<FoodController>().deleteItem(item);
                                if (Get.isDialogOpen!) Get.back();
                              },
                              onCancel: () {
                                if (Get.isDialogOpen!) Get.back();
                              },
                            ).show(context);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                    ],
                  ),
                ],
              ).paddingSymmetric(vertical: 4, horizontal: 12),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAlias,
              child: FutureBuilder<String>(
                future: FirebaseUtils.fileUrlFromFirebaseStorage(foodItem.imagePath),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const FadeShimmer(
                      height: 100,
                      width: 100,
                      radius: 4,
                      fadeTheme: FadeTheme.light,
                    );
                  }
                  return CachedNetworkImage(
                    imageUrl: snapshot.data!,
                    fit: BoxFit.cover,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UpdateItemView extends StatefulWidget {
  _UpdateItemView({required this.item})
      : _nameController = TextEditingController(text: item.name),
        _descController = TextEditingController(text: item.description),
        _priceController = TextEditingController(text: item.price.toString());
  final FoodItem item;

  final TextEditingController _nameController, _priceController, _descController;

  @override
  State<_UpdateItemView> createState() => _UpdateItemViewState(
        item.categories,
        item.tags,
      );
}

class _UpdateItemViewState extends State<_UpdateItemView> {
  _UpdateItemViewState(categories, tags)
      : _categories = categories,
        _tags = tags;

  final _formKey = GlobalKey<FormState>();

  final controller = Get.find<FoodController>();

  List<String> _categories, _tags;
  File? _image;

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
                    "Update Food Item",
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
                          controller: widget._nameController,
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
                          controller: widget._priceController,
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
                          controller: widget._descController,
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
                        FutureBuilder<List<FoodCategory>>(
                            future: Get.find<FoodCategoryUseCase>().getAllRestaurantCategories(
                              restaurantOwnerId: FirebaseAuth.instance.currentUser!.uid,
                            ),
                            builder: (context, snap) {
                              if (!snap.hasData) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              final initialValue = snap.data!.where((element) => _categories.contains(element.id)).toList();
                              return ChipsInput<FoodCategory>(
                                initialValue: initialValue,
                                findSuggestions: (String query) {
                                  if (query.isNotEmpty) {
                                    var lowercaseQuery = query.toLowerCase();
                                    final results = snap.data!.where((category) {
                                      return category.name.toLowerCase().contains(lowercaseQuery);
                                    }).toList(growable: false)
                                      ..sort((a, b) =>
                                          a.name.toLowerCase().indexOf(lowercaseQuery).compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
                                    return results;
                                  }
                                  return snap.data!;
                                },
                                onChanged: (data) {
                                  setState(() {
                                    _categories = data.map((e) => e.id).toList();
                                  });
                                },
                                chipBuilder: (context, state, category) {
                                  return InputChip(
                                    key: ValueKey(category.id),
                                    label: Text(category.name),
                                    onDeleted: () => state.deleteChip(category),
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  );
                                },
                                suggestionBuilder: (context, category) {
                                  return ListTile(
                                    key: ObjectKey(category),
                                    title: Text(category.name),
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
                            final allTags = Get.find<AppSettingsUseCase>().tags;
                            if (query.isNotEmpty) {
                              var lowercaseQuery = query.toLowerCase();
                              final results = allTags.where((tag) {
                                return tag.contains(query.toLowerCase());
                              }).toList(growable: false)
                                ..sort((a, b) => a.toLowerCase().indexOf(lowercaseQuery).compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
                              return results;
                            }
                            return allTags;
                          },
                          onChanged: (data) {
                            _tags = data;
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
                          icon: const Icon(Icons.update),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              showLoadingBottomSheet(context, title: 'Updating...');
                              await controller.updateItem(
                                item: widget.item,
                                name: widget._nameController.text,
                                description: widget._descController.text,
                                price: int.parse(widget._priceController.text),
                                categories: _categories,
                                tags: _tags,
                                image: _image,
                              );
                              if (Get.isBottomSheetOpen ?? false) {
                                Get.back();
                              }
                              if (Get.isDialogOpen ?? false) {
                                Get.back();
                              }
                              showSuccessSnackbar('Update Food Item', 'Food Item Updates Successfully');
                            }
                          },
                          label: const Text('Update'),
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
    if (image != null) {
      return Image.file(
        image,
        fit: BoxFit.cover,
      );
    } else {
      return FutureBuilder<String>(
        future: FirebaseUtils.fileUrlFromFirebaseStorage(widget.item.imagePath),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const FadeShimmer(
              height: 100,
              width: 100,
              radius: 4,
              fadeTheme: FadeTheme.light,
            );
          }
          return CachedNetworkImage(
            imageUrl: snapshot.data!,
            fit: BoxFit.cover,
          );
        },
      );
    }
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
