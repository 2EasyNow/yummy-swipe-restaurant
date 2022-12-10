import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';

import '../../../data/order/models/food_order.dart';

abstract class FoodOrderRepository {
  Stream<List<FoodOrder>> getOrders();
  Future<List<OrderProduct>> getOrderProducts(FoodOrder order);

  Future updateOrderStatus(FoodOrder order, OrderStatus accepted);
}
