import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resturant_owner.g.dart';

@JsonSerializable(createFieldMap: true)
class ResturantOwner {
  ResturantOwner({
    required this.resturantName,
    required this.name,
    required this.phone,
    required this.address,
    required this.coordinates,
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory ResturantOwner.fromJson(Map<String, Object?> json) => _$ResturantOwnerFromJson(json);
  toMap() => _$ResturantOwnerToJson(this);

  final String resturantName;
  final String name;
  final String phone;
  final String address;
  // Map coordinates
  @LatLngConverter()
  final LatLng coordinates;
  final bool active;
  @TimestampConverter()
  final DateTime? createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
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

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

//                                              DartType, FirebaseType
class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  // When Data comes from firebase
  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(json['lat']!, json['lng']!);
  }

  // When Data goes to firebase
  @override
  Map<String, dynamic> toJson(LatLng latlng) {
    return {'lat': latlng.latitude, 'lng': latlng.longitude};
  }
}
