import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/snackbars.dart';
import '../../../core/core.dart';
import '../../../domain/restaurant/use_cases/resturant_use_case.dart';

enum LoginAccountState {
  phoneVerification,
  codeSent,
  codeVerification,
  invalidCode,
  loggedIn,
  error,
}

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();
  final loginState = LoginAccountState.phoneVerification.obs;

  String? get phoneNumber {
    final number = phoneController.text.replaceAll('-', '');
    return '+923$number';
  }

  String? _verificationId;
  int? _forceResendCode;

  onLogin([Widget? bottomSheet]) async {
    if (!formKey.currentState!.validate()) return;

    final authController = Get.find<AuthenticationController>();
    final restaurantOwnerUseCase = Get.find<RestaurantUseCase>();
    if (!(await restaurantOwnerUseCase.isOwnerRegistered(phoneNumber!))) {
      if (Get.isBottomSheetOpen!) Get.back();
      showAppSnackBar('User Not found', "Please create an account first");
      return;
    }

    if (bottomSheet != null) {
      Get.bottomSheet(bottomSheet);
    }

    authController.signInWithPhoneNumber(
      phoneNumber!,
      onCompleteVerification: () {
        loginState.value = LoginAccountState.loggedIn;
      },
      onCodeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _forceResendCode = forceResendingToken;
        loginState.value = LoginAccountState.codeSent;
      },
    );
  }

  onVerifyCode() async {
    loginState.value = LoginAccountState.codeVerification;
    final authController = Get.find<AuthenticationController>();
    try {
      // createAccountState.value = CreateAccountState.codeVerifying;
      await authController.verifyCode(smsCodeController.text, _verificationId!);
      loginState.value = LoginAccountState.loggedIn;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        loginState.value = LoginAccountState.invalidCode;
      } else {
        loginState.value = LoginAccountState.error;
      }
    }
  }
}
