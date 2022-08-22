import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:intelligent_food_delivery/app/controllers/core/resturant_owner.controller.dart';
import 'core/authentication.controller.dart';
import 'core/resturant_owner.controller.dart';
import '../firestore/resturant_owner/resturant_owner.dart';

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

class CreateAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final resturantNameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final coordinatedController = TextEditingController();
  LatLng? resturantCoordinates;

  final phoneNumberScopeNode = FocusScopeNode();
  final coordinatedScopeNode = FocusScopeNode();

  String? get phoneNumber {
    final number = phoneController.text.replaceAll('-', '');
    return '+923$number';
  }

  String? _verificationId;
  int? _forceResendCode;

  final smsCodeController = TextEditingController();

  final createAccountState = CreateAccountState.info.obs;

  onCreateAccountWithPhoneNumber() async {
    if (!formKey.currentState!.validate()) return;
    if (resturantCoordinates == null) return;

    // check if the user is already registered

    createAccountState.value = CreateAccountState.verification;
    final authController = Get.find<AuthenticationController>();
    // authController.createUserWithPhone(email, password, name)

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
    final userController = Get.find<ResturantOwnerController>();
    final user = ResturantOwner(
      resturantName: resturantNameController.text,
      name: nameController.text,
      phone: phoneNumber!,
      address: addressController.text,
      coordinates: resturantCoordinates!,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
    await userController.createCustomerDoc(user);
    createAccountState.value = CreateAccountState.userCreated;
  }
}
