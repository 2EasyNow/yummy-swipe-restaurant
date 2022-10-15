import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/widgets/spacers.dart';
import 'package:intelligent_food_delivery/app/core/core.dart';
import 'package:intelligent_food_delivery/assets/assets.gen.dart';
import 'package:sizer/sizer.dart';

import '../../../common/theme/text_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy Swipe'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: InkWell(
              onTap: () => Get.toNamed(Routes.FOOD),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Assets.images.burger.image(
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Food',
                    style: AppTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpacer(space: 8),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => Get.toNamed(Routes.CATEGORIES),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Assets.images.burger.image(
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Categories',
                    style: AppTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpacer(space: 8),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Get.find<AuthenticationController>().logOut();
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Assets.icons.logout.svg(
                        width: 20.w,
                        fit: BoxFit.cover,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Logout',
                    style: AppTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpacer(space: 8),
                ],
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }
}
