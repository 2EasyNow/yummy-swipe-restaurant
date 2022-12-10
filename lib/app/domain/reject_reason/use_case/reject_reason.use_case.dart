import '../../../data/order/models/food_order.dart';
import '../model/reject_reason.dart';

class RejectReasonUseCase {
  static Future<RejectReasonDocumentReference> addOrderRejectReason(FoodOrder order, String reason) async {
    final rejectReason = RejectReason(
      id: order.id,
      restaurantId: order.restaurantId,
      customerId: order.customerId,
      orderId: order.id,
      reason: reason,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
    return await rejectReasonReference.add(rejectReason);
  }
}
