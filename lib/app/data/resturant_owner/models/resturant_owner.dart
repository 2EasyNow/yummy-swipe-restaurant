import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/converters/converters.dart';

part 'resturant_owner.g.dart';

@JsonSerializable(
  createFieldMap: true,
  createToJson: true,

)
class ResturantOwner {
  ResturantOwner({
    required this.resturantName,
    required this.name,
    required this.phone,
    required this.address,
    required this.coordinates,
    required this.openingTime,
    required this.closingTime,
    this.resturantTags = const [],
    this.bannerImagePath = '',
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory ResturantOwner.fromJson(Map<String, Object?> json) => _$ResturantOwnerFromJson(json);
  toMap() => _$ResturantOwnerToJson(this);

  // copyWith
  ResturantOwner copyWith({
    String? resturantName,
    String? name,
    String? phone,
    String? address,
    String? bannerImagePath,
    LatLng? coordinates,
    List<String>? resturantTags,
    TimeOfDay? openingTime,
    TimeOfDay? closingTime,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ResturantOwner(
      resturantName: resturantName ?? this.resturantName,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      resturantTags: resturantTags ?? this.resturantTags,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      bannerImagePath: bannerImagePath ?? this.bannerImagePath,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final String resturantName;
  final String name;
  final String phone;
  final String address;
  final String bannerImagePath;
  final List<String> resturantTags;

  @TimeOfDayToTimestampConverter()
  final TimeOfDay openingTime;
  @TimeOfDayToTimestampConverter()
  final TimeOfDay closingTime;
  @LatLngConverter()
  final LatLng coordinates;
  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
  final bool active;
}

@Collection<ResturantOwner>('Resturant')
final userRef = ResturantOwnerCollectionReference();

// @Collection<User>('Users')
// // @Collection<Comment>('Users/*/comments', name: 'comments')
// final moviesRef = MovieCollectionReference();

// @JsonSerializable()
// class Comment {
//   Comment({
//     required this.authorName,
//     required this.message,
//   });

//   final String authorName;
//   final String message;
// }

// from TimeOfDay to Timestamp and vice versa
