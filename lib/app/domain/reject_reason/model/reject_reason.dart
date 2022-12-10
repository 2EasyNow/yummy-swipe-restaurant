import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/converters/converters.dart';

part 'reject_reason.g.dart';

@JsonSerializable(createFieldMap: true)
class RejectReason {
  RejectReason({
    this.id = '',
    required this.restaurantId,
    required this.customerId,
    required this.orderId,
    required this.reason,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory RejectReason.fromJson(Map<String, Object?> json) => _$RejectReasonFromJson(json);
  toMap() => _$RejectReasonToJson(this);

  @Id()
  final String id;
  final String restaurantId;
  final String orderId;
  final String customerId;
  final String reason;

  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
}

@Collection<RejectReason>('RejectReason')
final rejectReasonReference = RejectReasonCollectionReference();
