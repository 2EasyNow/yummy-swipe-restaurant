import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';

class GettingStartedController extends GetxController {
  goToLoginScreen() {
    Get.toNamed(Routes.LOGIN);
  }

  goToSignUpScreen() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
