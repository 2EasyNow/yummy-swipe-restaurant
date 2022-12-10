import 'package:get/get.dart';

import '../controllers/restaurant_profile_controller.dart';

class RestaurantProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantProfileController>(
      () => RestaurantProfileController(),
    );
  }
}
