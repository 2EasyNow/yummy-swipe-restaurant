import '../../controllers/core/authentication.controller.dart';
import '../../controllers/core/resturant_owner.controller.dart';
import '../../ui/theme/theme.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/main_controller.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void init() {
    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    Get.put<ResturantOwnerController>(ResturantOwnerController(), permanent: true);
  }
}
