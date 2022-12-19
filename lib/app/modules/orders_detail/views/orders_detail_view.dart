import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:sizer/sizer.dart';

import '../../../common/theme/text_theme.dart';
import '../controllers/orders_detail_controller.dart';

class OrdersDetailView extends GetView<OrdersDetailController> {
  const OrdersDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OrdersDetailController>(builder: (_) {
          if (!controller.isProductsFetched) {
            return Center(
              child: SpinKitCircle(
                color: context.theme.colorScheme.primary,
              ),
            );
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const BackButton(),
                        Text(
                          'Order Detail',
                          style: AppTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingSymmetric(vertical: 12, horizontal: 16),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.orderProducts.length,
                        separatorBuilder: (context, index) {
                          return const Divider(height: 20);
                        },
                        itemBuilder: (context, index) {
                          final product = controller.orderProducts[index];
                          return Container(
                            height: 120,
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: FutureBuilder<String>(
                                    future: FirebaseUtils.fileUrlFromFirebaseStorage(product.imagePath),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const FadeShimmer(
                                          width: 100,
                                          height: 100,
                                          fadeTheme: FadeTheme.light,
                                        );
                                      }
                                      return CachedNetworkImage(
                                        imageUrl: snapshot.data!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) {
                                          return const FadeShimmer(
                                            width: 100,
                                            height: 100,
                                            fadeTheme: FadeTheme.light,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        product.productName,
                                        style: AppTextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Quantity: ${product.quantity}',
                                        style: AppTextStyle(),
                                      ),
                                      Text(
                                        'Price: Rs. ${product.price}',
                                        style: AppTextStyle(),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ).paddingSymmetric(horizontal: 16),
                    ),
                  ],
                ).paddingOnly(bottom: 100),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total Bill: ',
                            style: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('Rs. ${controller.order.totalBill}')
                        ],
                      ),
                      if (controller.order.status == OrderStatus.cooking)
                        TextButton(
                          onPressed: () => controller.onRiderPickedOrder(context),
                          child: const Text('Picked By Rider'),
                        ).paddingSymmetric(horizontal: 16, vertical: 8),
                      if (controller.order.status == OrderStatus.pending)
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => controller.onCancelOrder(context),
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
                                onPressed: () => controller.onAcceptOrder(context),
                                child: const Text('Accept'),
                              ),
                            ),
                          ],
                        )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
