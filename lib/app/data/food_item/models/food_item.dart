import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../common/converters/converters.dart';

part 'food_item.g.dart';

@JsonSerializable(createFieldMap: true)
class FoodItem {
  FoodItem({
    required this.resturantOwnerId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageName,
    this.categories = const [],
    this.tags = const [],
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory FoodItem.fromJson(Map<String, Object?> json) => _$FoodItemFromJson(json);
  toMap() => _$FoodItemToJson(this);

  // copyWith
  FoodItem copyWith({
    String? name,
    String? description,
    String? imageName,
    bool? active,
    int? price,
    List<String>? categories,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodItem(
      resturantOwnerId: resturantOwnerId,
      name: name ?? this.name,
      description: description ?? this.description,
      imageName: imageName ?? this.imageName,
      active: active ?? this.active,
      price: price ?? this.price,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String name;
  final String description;
  final String resturantOwnerId;
  final int price;
  final String imageName;
  final List<String> categories;
  final List<String> tags;
  final bool active;

  @TimestampConverter()
  final DateTime? createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  String get imagePath => 'resturants/$resturantOwnerId/$imageName';

}

@Collection<FoodItem>('FoodItems')
final foodItemRef = FoodItemCollectionReference();