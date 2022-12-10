import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';

import '../repositories/order_repository.dart';

class FoodOrderUseCase extends GetxService {
  final RxList<FoodOrder> allOrders = <FoodOrder>[].obs;
  final FoodOrderRepository _repository;
  StreamSubscription<List<FoodOrder>>? _ordersSubscription;
  StreamSubscription? _userChangedListener;

  FoodOrderUseCase(this._repository) {
    _userChangedListener = FirebaseAuth.instance.userChanges().listen((event) {
      if (event == null) {
        allOrders.clear();
      } else {
        fetchOrders();
      }
    });
  }

  fetchOrders() async {
    if (_ordersSubscription != null) {
      await _ordersSubscription!.cancel();
    }
    _ordersSubscription = _repository.getOrders().listen((event) {
      allOrders.clear();
      allOrders.addAll(event);
      allOrders.refresh();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _ordersSubscription?.cancel();
  }

  Future<List<OrderProduct>> fetchOrderProducts(FoodOrder order) {
    return _repository.getOrderProducts(order);
  }

  acceptOrder(FoodOrder order) async {
    await _repository.updateOrderStatus(order, OrderStatus.cooking);
  }
  Future cancelOrder(FoodOrder order) async {
    await _repository.updateOrderStatus(order, OrderStatus.canceledByRestaurant);
  }
}
