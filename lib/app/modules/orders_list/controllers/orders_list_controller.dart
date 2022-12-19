import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/domain/order/use_cases/order_use_case.dart';

class OrdersListController extends GetxController {
  final orderUseCase = Get.find<FoodOrderUseCase>();
  final orderTypes = [
    'All',
    'Pending',
    'Canceled',
    'Cooking in Progress',
    'Picked Up',
    'Delivered',
  ];
  final selectedOrderType = 'Pending'.obs;

  selectOrderType(String orderType) {
    selectedOrderType.value = orderType;
  }
}
