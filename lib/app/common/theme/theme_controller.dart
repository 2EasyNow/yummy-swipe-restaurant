import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'theme.dart';

class ThemeController extends GetxController {
  final lightColors = LightThemeColors();
  final darkColors = DarkThemeColors();

  @override
  onInit() async {
    super.onInit();
    setStatusBarColor();
    // var color = lightColors.background;
    // await FlutterStatusbarcolor.setNavigationBarColor(lightColors.backgroundVariant);
    // await FlutterStatusbarcolor.setStatusBarColor(color);
    // await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    // await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }

  setStatusBarColor() async {
    var color = lightColors.background;
    if (Get.isDarkMode) {
      color = darkColors.background;
      await FlutterStatusbarcolor.setNavigationBarColor(darkColors.backgroundVariant);
      await FlutterStatusbarcolor.setStatusBarColor(color);

      await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    } else {
      await FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
      await FlutterStatusbarcolor.setStatusBarColor(Colors.white);

      await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    }
  }
}
