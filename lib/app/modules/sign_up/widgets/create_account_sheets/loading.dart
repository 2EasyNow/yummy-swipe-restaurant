import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/text_theme.dart';


class LoadingSheetUI extends StatelessWidget {
  const LoadingSheetUI({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SpinKitCircle(
                color: AppColors(context).primary,
              ),
            ),
          )
        ],
      ).paddingAll(20),
    );
  }
}
