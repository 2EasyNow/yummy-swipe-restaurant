import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';

import '../models/order_product.dart';

abstract class FoodOrderDataSource {
  Stream<List<FoodOrder>> getOrders();

  Future<List<OrderProduct>> getOrderProducts(FoodOrder order);

  Future updateOrderStatus(FoodOrder order, OrderStatus status);
}
