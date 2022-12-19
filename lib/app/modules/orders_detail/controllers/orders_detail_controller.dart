import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/widgets/dialogs.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/core/services/fcm.service.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';
import 'package:intelligent_food_delivery/app/domain/order/use_cases/order_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/reject_reason/model/reject_reason.dart';
import 'package:intelligent_food_delivery/app/domain/rider/use_case/rider.use_case.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';

import '../../../common/theme/app_colors.dart';
import '../../../domain/reject_reason/use_case/reject_reason.use_case.dart';

class OrdersDetailController extends GetxController {
  final orderUseCase = Get.find<FoodOrderUseCase>();

  late final FoodOrder order;
  final List<OrderProduct> orderProducts = [];
  bool isProductsFetched = false;

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments as FoodOrder;
    fetchOrderProducts();
  }

  fetchOrderProducts() async {
    orderProducts.addAll(await orderUseCase.fetchOrderProducts(order));
    isProductsFetched = true;
    update();
  }

  void onCancelOrder(context) {
    showAppDialog(
      context,
      title: 'Cancel Reason?',
      icon: const Icon(
        Icons.cancel,
        color: Colors.red,
      ),
      body: RejectOrderConfirmation(
        onCancel: (reason) async {
          if (reason.isEmpty) {
            showAppSnackBar('Reason', 'Please enter a reason');
            return;
          }
          final fcmService = Get.find<FCMService>();
          final user = await FirebaseFirestore.instance.collection('AppUser').doc(order.customerId).get();
          final tokens = (user.data()!['fcmTokens'] as List<dynamic>).map((e) => e.toString()).toList();

          await RejectReasonUseCase.addOrderRejectReason(order, reason);
          fcmService.sendPushMessage('Order Cancel', 'Your order has been canceled open the app to see the details.', tokens, data: {
            'type': 'order',
            'order_id': order.id,
            'order_status': 'rejected',
            'reason': reason,
          });
          await orderUseCase.cancelOrder(order);
          Get.offNamedUntil(Routes.ORDERS_LIST, (route) => false);
          showAppSnackBar('Cancel Order', 'Successfully Cancelled the order');
        },
      ),
    );
  }

  void onAcceptOrder(context) {
    // Steps to Accept an Order
    // First Look For the nearest available driver
    // Then Assign the driver to the order
    // Send a push notification to the driver that you have to reach at {Restaurant} in {Time}
    // Send a push notification to the customer that the order is accepted and the driver is on the way
    // if there is no driver available then show a dialog to the restaurant owner that there is no driver available
    // and ask him to wait for some time or cancel the order
    final riderUseCase = RiderUseCase();
    StreamSubscription? riderStream;
    riderStream = riderUseCase.getNearbyRiders().listen((event) {
      if (event.isEmpty) {
        showAppDialog(
          Get.context!,
          title: 'No Rider Available',
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('There is no rider available at the moment. Please wait for some time or cancel the order'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors(context).errorDark,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextButton(
                      onPressed: Get.back,
                      child: const Text('Wait'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
        riderStream?.cancel();
      } else {
        riderUseCase.assignRiderToOrder(order, event.first);
        showAppSnackBar('Order Accepted', 'Order has been accepted');
        riderStream?.cancel();
        // Get.offNamedUntil(Routes.ORDERS_LIST, (route) => false);
      }
    });
  }

  void onRiderPickedOrder(context) {
    // Steps to Pick an Order
    // Ask for Confirmation
    // Send a push notification to the customer that the rider has picked the order
    // update the order status to picked

    showAppDialog(
      context,
      title: 'Are you sure?',
      icon: const Icon(
        Icons.cancel,
        color: Colors.red,
      ),
      body: RiderPickedConfirmation(
        onConfirm: () async {

          final fcmService = Get.find<FCMService>();
          final user = await customerRef.doc(order.customerId).get();
          fcmService.sendPushMessage('Rider Picked', 'Your order has been picked by the rider. you will receive the order soon.', user.data!.fcmTokens, data: {
            'type': 'order',
            'order_id': order.id,
            'order_status': OrderStatus.pickedUpByRider.name,
          });
          await foodOrdersRef.doc(order.id).set(order.copyWith(status: OrderStatus.pickedUpByRider));
          Get.offNamedUntil(Routes.ORDERS_LIST, (route) => false);
          showAppSnackBar('Cancel Order', 'Successfully Cancelled the order');
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }
}

class RejectOrderConfirmation extends StatelessWidget {
  RejectOrderConfirmation({super.key, required this.onCancel});

  final Function(String) onCancel;
  final _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Enter the reason for the order cancellation."),
        const SizedBox(height: 8),
        TextFormField(
          minLines: 3,
          maxLines: 5,
          controller: _reasonController,
          decoration: const InputDecoration(
            hintText: 'Enter reason',
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextButton(

                onPressed: () {
                  Get.back();
                },
                child: const Text("No"),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors(context).errorDark,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => onCancel(_reasonController.text),

                child: const Text("Yes"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RiderPickedConfirmation extends StatelessWidget {
  const RiderPickedConfirmation({Key? key, required this.onConfirm, required this.onCancel}) : super(key: key);

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors(context).errorDark,
                  foregroundColor: Colors.white,
                ),
                onPressed: onCancel,
                child: const Text("No"),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextButton(
                onPressed: onConfirm,

                child: const Text("Yes"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
