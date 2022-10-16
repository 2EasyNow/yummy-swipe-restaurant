import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/text_theme.dart';
import '../../../../common/widgets/spacers.dart';
import '../../controllers/sign_up_controller.dart';


class InvalidOTPCodeSheetUI extends GetView<SignUpController> {
  const InvalidOTPCodeSheetUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Invalid OTP Code',
          style: AppTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacer(),
        const Text('You have entered an invalid OTP code. Please try again.'),
        const VerticalSpacer(),
        TextButton(
          onPressed: () {
            controller.createAccountState.value = CreateAccountState.codeSent;
          },
          style: TextButton.styleFrom(
            minimumSize: Size(Get.width, 60),
            backgroundColor: AppColors(context).errorDark,
          ),
          child: Text(
            'Try Again',
            style: AppTextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    ).paddingAll(20);
  }
}
