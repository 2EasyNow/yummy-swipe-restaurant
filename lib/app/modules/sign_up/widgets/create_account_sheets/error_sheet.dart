import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/text_theme.dart';
import '../../../../common/widgets/spacers.dart';
import '../../controllers/sign_up_controller.dart';

class ErrorSheetUI extends GetView<SignUpController> {
  const ErrorSheetUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Error',
          style: AppTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacer(),
        const Text('Something went wrong. Please try again.'),
        const VerticalSpacer(),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: Get.back,
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(Get.width, 60),
                  side: BorderSide(
                    color: AppColors(context).errorDark,
                  ),
                ),
                child: Text(
                  'Close',
                  style: AppTextStyle(
                    color: AppColors(context).errorDark,
                  ),
                ),
              ),
            ),
            const HorizontalSpacer(),
            Expanded(
              child: TextButton(
                onPressed: controller.onCreateAccountWithPhoneNumber,
                style: TextButton.styleFrom(
                  minimumSize: Size(Get.width, 60),
                ),
                child: const Text('Try Again'),
              ),
            ),
          ],
        )
      ],
    ).paddingAll(20);
  }
}
