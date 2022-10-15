import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/converters/converters.dart';

part 'food_category.g.dart';

@JsonSerializable(createFieldMap: true)
class FoodCategory {
  FoodCategory({
    required this.resturantOwnerId,
    required this.name,
    this.totalFoodItems = 0,
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory FoodCategory.fromJson(Map<String, Object?> json) => _$FoodCategoryFromJson(json);
  toMap() => _$FoodCategoryToJson(this);

  // copyWith
  FoodCategory copyWith({
    String? name,
    bool? active,
    int? totalFoodItems,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodCategory(
      resturantOwnerId: resturantOwnerId,
      name: name ?? this.name,
      active: active ?? this.active,
      totalFoodItems: totalFoodItems ?? this.totalFoodItems,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String resturantOwnerId;
  final String name;
  final bool active;
  final int totalFoodItems;

  @TimestampConverter()
  final DateTime? createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
}

@Collection<FoodCategory>('FoodCategory')
final foodCategoriesReference = FoodCategoryCollectionReference();