import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/resturant_owner_use_case.dart';
import '../../../core/core.dart';

enum CreateAccountState {
  info,
  verification,
  verificationSuccess,
  codeSent,
  codeVerification,
  codeVerifying,
  codeVerificationFailed,
  userCreation,
  userCreated,
  error,
}

class SignUpController extends GetxController {
  int currentStep = 0;
  final firstStepFormKey = GlobalKey<FormState>();
  final secondStepFormKey = GlobalKey<FormState>();
  final resturantNameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final coordinatedController = TextEditingController();
  final openingTimeController = TextEditingController();
  final closingTimeController = TextEditingController();

  LatLng? resturantCoordinates;
  List<String> resturantTags = [];
  TimeOfDay? _openingTime, _closingTime;

  set openingTime(val) {
    _openingTime = val;
    openingTimeController.text = val.format(Get.context!);
  }

  set closingTime(val) {
    _closingTime = val;
    closingTimeController.text = val.format(Get.context!);
  }

  final phoneNumberScopeNode = FocusScopeNode();
  final coordinatedScopeNode = FocusScopeNode();

  File? bannerImage;

  String? get phoneNumber {
    final number = phoneController.text.replaceAll('-', '');
    return '+923$number';
  }

  String? _verificationId;
  int? _forceResendCode;

  final smsCodeController = TextEditingController();

  final createAccountState = CreateAccountState.info.obs;

  onCreateAccountWithPhoneNumber([Widget? bottomSheet]) async {
    // check wether all the fields are filled or not
    if (!secondStepFormKey.currentState!.validate()) return;
    if (resturantCoordinates == null) {
      showErrorSnackbar('Resturant Location', "Please select resturant's location coordinates");
      return;
    }
    if (_openingTime == null || _closingTime == null) {
      showErrorSnackbar('Resturant Timing', "Please select resturant's opening and closing time");
      return;
    }

    // check if it is already registerd or not
    final resturantOwnerUseCase = Get.find<ResturantOwnerUseCase>();
    if (await resturantOwnerUseCase.isOwnerRegistered(phoneNumber!)) {
      showErrorSnackbar('Register Resturant', "Resturant with this phone number is already registered");
      currentStep = 0;
      update();
      phoneNumberScopeNode.requestFocus();
      return;
    }

    if (bottomSheet != null) {
      Get.bottomSheet(bottomSheet);
    }

    createAccountState.value = CreateAccountState.verification;
    final authController = Get.find<AuthenticationController>();

    authController.signInWithPhoneNumber(
      phoneNumber!,
      onCompleteVerification: () {
        createAccountState.value = CreateAccountState.userCreation;
        // Next Step is to Save User Data
      },
      onCodeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _forceResendCode = forceResendingToken;
        createAccountState.value = CreateAccountState.codeSent;
        // Next Step is ask user to enter code
      },
    );
  }

  onVerifyCode() async {
    final authController = Get.find<AuthenticationController>();
    try {
      // createAccountState.value = CreateAccountState.codeVerifying;
      await authController.verifyCode(smsCodeController.text, _verificationId!);
      createAccountState.value = CreateAccountState.userCreation;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        createAccountState.value = CreateAccountState.codeVerificationFailed;
      } else {
        createAccountState.value = CreateAccountState.error;
      }
    }
  }

  void saveUserData() async {
    final useCase = Get.find<ResturantOwnerUseCase>();
    await useCase.createResturantOwner(
      name: nameController.text,
      resturantName: resturantNameController.text,
      phone: phoneNumber!,
      bannerImage: bannerImage!,
      address: addressController.text,
      coordinates: resturantCoordinates!,
      resturantTags: resturantTags,
      openingTime: _openingTime!,
      closingTime: _closingTime!,
    );
    createAccountState.value = CreateAccountState.userCreated;
  }

  onStepTapped(int step) {
    if (currentStep == step) return;
    if (currentStep == 0) {
      if (!firstStepFormKey.currentState!.validate()) return;
      if (bannerImage == null) {
        showErrorSnackbar('Resturant Banner', "Please select resturant's banner image");
        return;
      }
      currentStep = step;
      update();
    } else {
      currentStep = step;
      update();
    }
  }
}
