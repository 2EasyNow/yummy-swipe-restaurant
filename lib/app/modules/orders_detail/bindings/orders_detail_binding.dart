import 'package:get/get.dart';

import '../controllers/orders_detail_controller.dart';

class OrdersDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersDetailController>(
      () => OrdersDetailController(),
    );
  }
}
