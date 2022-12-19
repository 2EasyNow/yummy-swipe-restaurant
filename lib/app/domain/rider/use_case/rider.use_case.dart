import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';
import 'package:intelligent_food_delivery/app/domain/restaurant/use_cases/resturant_use_case.dart';

import '../../../core/services/fcm.service.dart';
import '../../../data/app_user/models/app_user.dart';
import '../../../data/rider/rider.dart';
import '../../app_settings/usecase/app_setttings_use_case.dart';
import '../../order/use_cases/order_use_case.dart';
import '../../reject_reason/use_case/reject_reason.use_case.dart';

class RiderUseCase{
  final orderUseCase = Get.find<FoodOrderUseCase>();


  Stream<List<Rider>> getNearbyRiders() {
    final settingsUseCase = Get.find<AppSettingsUseCase>();
    final restaurantUseCase = Get.find<RestaurantUseCase>();
    final restaurantCoordinates = restaurantUseCase.currentUser!.coordinates;
    final geo = GeoFlutterFire();
    GeoFirePoint center = geo.point(
      latitude: restaurantCoordinates.latitude,
      longitude: restaurantCoordinates.longitude,
    );
    double radius = settingsUseCase.appSettings!.searchInKm.toDouble();
    print('Searching in $radius km radius');
    String field = 'location';
    return geo
        .collection(
      collectionRef: FirebaseFirestore.instance.collection('Rider'),
    )
        .within(
      center: center,
      radius: radius,
      field: field,
    )
        .asyncMap((event) {
      return event.map(
            (e) {
          return Rider.fromJson({'id': e.id, ...e.data() as dynamic});
        },
      ).where((element) => element.currentOrderId.isEmpty).toList();
    });
  }

  assignRiderToOrder(FoodOrder order, Rider first) async {
    foodOrdersRef.doc(order.id).set(order.copyWith(
      status: OrderStatus.cooking,
      riderId: first.id,
    ));

    await riderRef.doc(first.id).update(currentOrderId: order.id);

    final customer = (await customerRef.doc(order.customerId).get()).data!;
    final restaurant = (await userRef.doc(order.restaurantId).get()).data!;
    final fcmService = Get.find<FCMService>();

    // Send to User
    fcmService.sendPushMessage('Order Accepted', 'Your order has been been accepted and ${first.name} will deliver your order soon.', customer.fcmTokens, data: {
      'type': 'order',
      'order_id': order.id,
      'order_status': 'accepted',
    });

    // Send to Rider
    fcmService.sendPushMessage('New Order', '${first.name} you got a new order be ready to deliver it to ${customer.name} in ${restaurant.averageTimeToCompleteOrder} mins', first.fcmTokens, data: {
      'type': 'order',
      'order_id': order.id,
      'order_status': 'accepted',
    });

  }
}