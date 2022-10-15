import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

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
