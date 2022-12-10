import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/widgets/dialogs.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/core/services/fcm.service.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';
import 'package:intelligent_food_delivery/app/domain/order/use_cases/order_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/reject_reason/model/reject_reason.dart';
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

  void onAcceptOrder() {
    orderUseCase.acceptOrder(order);
  }
}

class RejectOrderConfirmation extends StatelessWidget {
  RejectOrderConfirmation({super.key, required this.onCancel});
  final Function(String) onCancel;
  final _reasonControllr = TextEditingController();

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
          controller: _reasonControllr,
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
                onPressed: () => onCancel(_reasonControllr.text),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors(context).errorDark,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Yes"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
