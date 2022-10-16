import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_input/chips_input.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';

import '../../../../assets/assets.gen.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_theme.dart';
import '../../../common/utils/firebase.dart';
import '../../../common/widgets/bottom_sheets.dart';
import '../../../common/widgets/dialogs.dart';
import '../../../common/widgets/input_formatters.dart';
import '../../../common/widgets/spacers.dart';
import '../../../domain/app_settings/usecase/app_setttings_use_case.dart';
import '../../../domain/app_user/use_cases/resturant_owner_use_case.dart';
import '../../sign_up/widgets/location_permission.dart';
import '../controllers/resturant_profile_controller.dart';
import '../widgets/resturant_coordinate_picker.dart';

class ResturantProfileView extends GetView<ResturantProfileController> {
  ResturantProfileView({super.key});
  final double spaceBetweenFields = 1.5.h;
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
                  'Resturant Profile',
                  style: AppTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingSymmetric(vertical: 12, horizontal: 16),
              ],
            ),
            GetBuilder<ResturantProfileController>(builder: (_) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Banner Image
                        // 2. All Resturant Owner info (name, address, phone number, etc)
                        _BannerImage(imagePath: controller.currentUser!.bannerImagePath),
                        const VerticalSpacer(space: 12),

                        Text('Resturant Name', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        TextFormField(
                          controller: controller.resturantNameController,
                          autofillHints: const [AutofillHints.organizationName],
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) return "Resturant Name can't be empty";
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Assets.icons.forkKnife.svg(color: AppColors(context).grey600, height: 24).paddingSymmetric(vertical: 12),
                          ),
                        ),
                        VerticalSpacer(space: spaceBetweenFields),
                        /////////         Name Field         /////////
                        Text('Owner Name', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        TextFormField(
                          controller: controller.resturantOwnerNameController,
                          autofillHints: const [AutofillHints.name],
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) return "Name can't be empty";
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Assets.icons.profileOutline.svg(color: AppColors(context).grey600).paddingSymmetric(vertical: 12),
                          ),
                        ),
                        /////////         Phone Number Field         /////////
                        VerticalSpacer(space: spaceBetweenFields),
                        Text('Phone Number', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        TextFormField(
                          controller: controller.resturantPhoneNumberController,
                          autofillHints: const [AutofillHints.telephoneNumber],
                          focusNode: controller.phoneNumberScopeNode,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                            PakistanPhoneNumberFormatter(separator: '-', smaple: 'XX-XXXXXXX'),
                          ],
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            // Valid Phone format XX-XXXXXXX
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^[0-9]{2}-[0-9]{7}$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Assets.icons.call.svg(color: AppColors(context).grey600).paddingSymmetric(vertical: 12),
                            prefix: Text(
                              '+92 3',
                              style: AppTextStyle(
                                color: AppColors(context).onBackground,
                              ),
                            ),
                          ),
                        ),
                        /////////         Address Field         /////////
                        VerticalSpacer(space: spaceBetweenFields),
                        Text('Address', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        TextFormField(
                          controller: controller.resturantAddressController,
                          autofillHints: const [AutofillHints.addressCityAndState],
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter the resturant address';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 3,
                          minLines: 1,
                          decoration: InputDecoration(
                            prefixIcon: Assets.icons.address.svg(color: AppColors(context).grey600).paddingSymmetric(vertical: 12),
                          ),
                        ),
                        /////////         Coordinated Field         /////////
                        VerticalSpacer(space: spaceBetweenFields),
                        Text('Resturant Coordinates', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        TextFormField(
                          controller: controller.resturantCoordinatesController,
                          focusNode: controller.coordinatedScopeNode,
                          autofillHints: const [AutofillHints.location],
                          onTap: () async {
                            controller.coordinatedScopeNode.unfocus();
                            final permissionStatus = await Location.instance.hasPermission();
                            if (permissionStatus != PermissionStatus.granted) {
                              // ignore: use_build_context_synchronously
                              showAppGeneralBottomSheet(
                                context,
                                title: "Location Permission",
                                body: LocationPermissionSheet(
                                  onSuccessfullyGranted: () async {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                    Get.generalDialog(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return const Material(
                                          child: ResturantCoordinatesPicker(),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              Get.generalDialog(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return const Material(
                                    child: ResturantCoordinatesPicker(),
                                  );
                                },
                              );
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select the resturant coordinates';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Assets.icons.location.svg(color: AppColors(context).grey600).paddingSymmetric(vertical: 12),
                          ),
                        ),
                        VerticalSpacer(space: spaceBetweenFields),
                        Text('Opening Time', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        textButtonTheme: const TextButtonThemeData(),
                                      ),
                                      child: child!,
                                    );
                                  }).then((value) {
                                if (value != null) {
                                  controller.openingTime = value;
                                }
                              });
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: controller.openingTimeController,
                              ),
                            ),
                          ),
                        ),
                        VerticalSpacer(space: spaceBetweenFields),
                        Text('Closing Time', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        textButtonTheme: const TextButtonThemeData(),
                                      ),
                                      child: child!,
                                    );
                                  }).then((value) {
                                if (value != null) {
                                  controller.closingTime = value;
                                }
                              });
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: controller.closingTimeController,
                              ),
                            ),
                          ),
                        ),

                        VerticalSpacer(space: spaceBetweenFields),
                        Text('Resturant Food Type', style: AppTextStyle(color: AppColors(context).grey400)),
                        VerticalSpacer(space: 0.5.h),
                        ChipsInput<String>(
                          initialValue: controller.resturantTags,
                          findSuggestions: (String query) {
                            final allTags = Get.find<AppSettingsUseCase>().tags;
                            if (query.isNotEmpty) {
                              var lowercaseQuery = query.toLowerCase();
                              final results = allTags.where((tag) {
                                return tag.toLowerCase().contains(lowercaseQuery);
                              }).toList(growable: false)
                                ..sort((a, b) => a.toLowerCase().indexOf(lowercaseQuery).compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
                              return results;
                            }
                            return allTags;
                          },
                          onChanged: (data) {
                            controller.resturantTags = data;
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
                        VerticalSpacer(space: 1.5.h),
                        TextButton.icon(
                          onPressed: () => controller.updateResturantInfo(context),
                          icon: const Icon(Icons.update),
                          label: const Text('Update Profile'),
                        ),
                        VerticalSpacer(space: spaceBetweenFields),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 12),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _BannerImage extends StatelessWidget {
  const _BannerImage({required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder<String>(
        future: FirebaseUtils.fileUrlFromFirebaseStorage(imagePath),
        builder: (context, snapshot) {
          if (imagePath.isEmpty) {
            return GestureDetector(
              onTap: () => _imagePicker(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.image),
                  Text(
                    'Add Banner Image',
                    textAlign: TextAlign.center,
                    style: AppTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error in Loading'));
          } else if (!snapshot.hasData) {
            return const FadeShimmer(
              height: 100,
              width: 100,
              radius: 4,
              fadeTheme: FadeTheme.light,
            );
          }
          return GestureDetector(
            onTap: () => _imagePicker(context),
            child: CachedNetworkImage(
              imageUrl: snapshot.data!,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  // show a dialog to select image from camera or gallery
  Future _imagePicker(context) async {
    final ownerUseCase = Get.find<ResturantOwnerUseCase>();
    final controller = Get.find<ResturantProfileController>();
    FocusScope.of(context).unfocus();

    onImagePick(File image) async {
      Get.back();
      showLoadingDialog(context, title: 'Uploading Image');
      final user = await ownerUseCase.updateBannerImage(File(image.path));
      if (user.bannerImagePath.isNotEmpty) {
        controller.update();
        Get.back();
      }
    }

    return showAppDialog(
      context,
      title: 'Image Source',
      icon: const Icon(Icons.image),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              final imageX = await ImagePicker().pickImage(
                source: ImageSource.camera,
                imageQuality: 30,
              );
              if (imageX != null) {
                await onImagePick(File(imageX.path));
              }
            },
            label: const Text('Camera'),
          ),
          const VerticalSpacer(space: 8),
          TextButton.icon(
            icon: const Icon(Icons.image),
            onPressed: () async {
              final imageX = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 30,
              );
              if (imageX != null) {
                await onImagePick(File(imageX.path));
              }
            },
            label: const Text('Gallery'),
          ),
        ],
      ),
    );
  }
}
