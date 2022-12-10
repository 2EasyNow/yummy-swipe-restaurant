import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../common/theme/text_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/orders_list_controller.dart';

class OrdersListView extends GetView<OrdersListController> {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final selectedOrderType = controller.selectedOrderType.value;
          final orders = controller.orderUseCase.allOrders.where((order) {
            final orderType = selectedOrderType.toLowerCase();
            if (orderType == 'all') {
              return true;
            } else if (orderType == 'pending' && order.status == OrderStatus.pending) {
              return true;
            } else if (orderType == 'cooking in progress' && order.status == OrderStatus.cooking) {
              return true;
            } else if (orderType == 'picked up' && order.status == OrderStatus.pickedUpByRider) {
              return true;
            } else if (orderType == 'delivered' && order.status == OrderStatus.delivered) {
              return true;
            } else if (orderType == 'canceled' &&
                (order.status == OrderStatus.canceledByCustomer || order.status == OrderStatus.canceledByRestaurant)) {
              return true;
            } else {
              return false;
            }
          }).toList();
          return Column(
            children: [
              Row(
                children: [
                  const BackButton(),
                  Text(
                    'Orders List',
                    style: AppTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingSymmetric(vertical: 12, horizontal: 16),
                ],
              ),
              OrderFilterationChips(
                selectedOrderType: selectedOrderType,
              ).paddingSymmetric(horizontal: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: orders.length,
                  separatorBuilder: (context, index) {
                    return const Divider(height: 0);
                  },
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          orderCardRow('Total Items', order.totalItems.toString()),
                          const SizedBox(height: 8),
                          orderCardRow('Total Amount', 'Rs. ${order.totalBill}'),
                          const SizedBox(height: 8),
                          orderCardRow('OrderedAt', '${DateFormat.jm().format(order.createdAt!)} ${DateFormat.yMMMEd().format(order.createdAt!)}'),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ORDERS_DETAIL, arguments: order);
                            },
                            child: const Text('Details'),
                          )
                        ],
                      ),
                    );
                  },
                ).paddingAll(20),
              ),
            ],
          );
        }),
      ),
    );
  }

  Row orderCardRow(String title, String content) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: AppTextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(content),
      ],
    );
  }
}

class OrderFilterationChips extends GetView<OrdersListController> {
  const OrderFilterationChips({
    Key? key,
    required this.selectedOrderType,
  }) : super(key: key);

  final String selectedOrderType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.orderTypes.length,
        itemBuilder: (context, index) {
          return InputChip(
            label: Text(controller.orderTypes[index]),
            onPressed: () => controller.selectOrderType(controller.orderTypes[index]),
            elevation: 0,
            selected: controller.orderTypes[index] == selectedOrderType,
            selectedColor: AppColors(context).primary,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 4);
        },
      ),
    );
  }
}
