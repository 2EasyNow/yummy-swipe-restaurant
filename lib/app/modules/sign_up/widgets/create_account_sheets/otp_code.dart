import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/text_theme.dart';
import '../../../../common/widgets/spacers.dart';
import '../../controllers/sign_up_controller.dart';


class OTPCodeUI extends GetView<SignUpController> {
  const OTPCodeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter OTP Code',
            style: AppTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpacer(),
          OTPTextField(
            length: 6,
            width: MediaQuery.of(context).size.width,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            // spaceBetween: true,
            otpFieldStyle: OtpFieldStyle(
              borderColor: AppColors(context).grey100,
              focusBorderColor: AppColors(context).primary,
              backgroundColor: AppColors(context).grey100,
            ),
            fieldWidth: 50,
            fieldStyle: FieldStyle.box,
            onChanged: (value) {
              controller.smsCodeController.text = value;
            },
            onCompleted: (pin) {
              print("Completed: $pin");
            },
          ),
          const VerticalSpacer(),
          TextButton(
            onPressed: controller.onVerifyCode,
            style: TextButton.styleFrom(
              minimumSize: Size(Get.width, 60),
            ),
            child: const Text('Verify'),
          ),
        ],
      ).paddingAll(20),
    );
  }
}
