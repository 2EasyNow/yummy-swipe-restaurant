import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/core/services/fcm.service.dart';
import 'package:intelligent_food_delivery/app/data/order/data_sources/food_order_data_source.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';

class FoodOrderRemoteDataSource implements FoodOrderDataSource {
  @override
  Stream<List<FoodOrder>> getOrders() {
    var toOrderTransformer = StreamTransformer<FoodOrderQuerySnapshot, List<FoodOrder>>.fromHandlers(
      handleData: (data, sink) {
        sink.add(data.docs.map((e) => e.data).toList());
      },
    );
    return foodOrdersRef
        .whereRestaurantId(
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots()
        .transform(toOrderTransformer);
  }

  @override
  Future<List<OrderProduct>> getOrderProducts(FoodOrder order) {
    return orderProductsRef.whereOrderId(isEqualTo: order.id).get().then((value) => value.docs.map((e) => e.data).toList());
  }

  @override
  Future updateOrderStatus(FoodOrder order, OrderStatus status)async {
    return foodOrdersRef.doc(order.id).set(order.copyWith(status: status));
  }
}
