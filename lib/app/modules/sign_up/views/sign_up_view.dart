import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_input/chips_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intelligent_food_delivery/app/modules/sign_up/widgets/create_account_sheets/create_account_sheets.dart';
import 'package:location/location.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../../../../assets/assets.gen.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_theme.dart';
import '../../../common/widgets/bottom_sheets.dart';
import '../../../common/widgets/dialogs.dart';
import '../../../common/widgets/input_formatters.dart';
import '../../../common/widgets/spacers.dart';
import '../../../common/widgets/timer_button.dart';
import '../../../domain/app_settings/usecase/app_setttings_use_case.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/widgets.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: AppTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: GetBuilder<SignUpController>(
          builder: (_) {
            return Stepper(
              type: StepperType.horizontal,
              elevation: 0.0,
              currentStep: controller.currentStep,
              onStepTapped: controller.onStepTapped,
              controlsBuilder: (context, details) {
                return Container();
              },
              steps: [
                Step(
                  title: const Text("Personal"),
                  content: _FirstStepForm(),
                  isActive: controller.currentStep == 0,
                ),
                Step(
                  title: const Text("Resturant"),
                  content: _SecondStepForm(),
                  isActive: controller.currentStep == 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FirstStepForm extends GetView<SignUpController> {
  _FirstStepForm();

  final double spaceBetweenFields = 1.5.h;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.firstStepFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BannerImage(),
            VerticalSpacer(space: 0.5.h),
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
              controller: controller.nameController,
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
              focusNode: controller.phoneNumberScopeNode,
              controller: controller.phoneController,
              autofillHints: const [AutofillHints.telephoneNumber],
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
            VerticalSpacer(space: 0.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Already have an account?",
                  style: AppTextStyle(color: AppColors(context).grey600),
                ),
                GestureDetector(
                  onTap: () => Get.offNamed(Routes.LOGIN),
                  child: Text(
                    " Log In",
                    style: AppTextStyle(
                      color: AppColors(context).primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpacer(space: 1.h),
            /////////         Submit Button         /////////
            TextButton(
              onPressed: () => controller.onStepTapped(1),
              style: TextButton.styleFrom(
                minimumSize: Size(Get.width, 60),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Next'),
                  HorizontalSpacer(space: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondStepForm extends GetView<SignUpController> {
  _SecondStepForm();

  final double spaceBetweenFields = 1.5.h;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.secondStepFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address', style: AppTextStyle(color: AppColors(context).grey400)),
            VerticalSpacer(space: 0.5.h),
            TextFormField(
              controller: controller.addressController,
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
              controller: controller.coordinatedController,
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
            VerticalSpacer(space: 0.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Already have an account?",
                  style: AppTextStyle(color: AppColors(context).grey600),
                ),
                GestureDetector(
                  onTap: () => Get.offNamed(Routes.LOGIN),
                  child: Text(
                    " Log In",
                    style: AppTextStyle(
                      color: AppColors(context).primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpacer(space: 0.5.h),
            /////////         Submit Button         /////////
            TextButton(
              onPressed: () => controller.onCreateAccountWithPhoneNumber(const _CreateAccountBottomSheet()),
              style: TextButton.styleFrom(
                minimumSize: Size(Get.width, 60),
              ),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateAccountBottomSheet extends GetView<SignUpController> {
  const _CreateAccountBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200, 30),
          ),
        ),
        child: Obx(() {
          if (controller.createAccountState.value == CreateAccountState.verification) {
            return const LoadingSheetUI(title: 'Creating Account');
          } else if (controller.createAccountState.value == CreateAccountState.codeSent) {
            return const OTPCodeUI();
          } else if (controller.createAccountState.value == CreateAccountState.userCreation) {
            controller.saveUserData();
            return const LoadingSheetUI(title: 'Saving Profile');
          } else if (controller.createAccountState.value == CreateAccountState.codeVerificationFailed) {
            return const InvalidOTPCodeSheetUI();
          } else if (controller.createAccountState.value == CreateAccountState.error) {
            return const ErrorSheetUI();
          } else if (controller.createAccountState.value == CreateAccountState.userCreated) {
            return const AccountCreatedSheetUI();
          }
          return Container();
        }),
      ),
    );
  }
}

class _BannerImage extends StatelessWidget {
  const _BannerImage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => _imagePicker(context),
          child: Container(
            height: 200,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: controller.bannerImage == null
                ? Column(
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
                  )
                : Image.file(
                    controller.bannerImage!,
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
    );
  }

  // show a dialog to select image from camera or gallery
  Future _imagePicker(context) async {
    final controller = Get.find<SignUpController>();
    FocusScope.of(context).unfocus();

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
                controller.bannerImage = File(imageX.path);
                controller.update();
                Get.back();
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
                controller.bannerImage = File(imageX.path);
                controller.update();
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
