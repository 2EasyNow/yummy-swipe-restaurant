import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/text_theme.dart';
import '../../../../common/widgets/spacers.dart';
import '../../../../common/widgets/timer_button.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/sign_up_controller.dart';


class AccountCreatedSheetUI extends StatelessWidget {
  const AccountCreatedSheetUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Account Created',
          style: AppTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacer(),
        Icon(
          Icons.check_circle,
          color: AppColors(context).success,
          size: 90,
        ),
        const VerticalSpacer(),
        TimerButton(
          onTap: () => Get.offAllNamed(Routes.ON_BOARDING),
          time: 3,
          backgroundColor: AppColors(context).primary,
          textColor: AppColors(context).onPrimary,
          title: 'Continue',
        ),
      ],
    ).paddingAll(20);
  }
}
