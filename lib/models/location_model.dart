// models/location.dart
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final String name;
  final String description;
  final String imageUrl;
  final LatLng latLng;
  final String distance;
  final String openTime;
  final String price;

  Location({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.latLng,
    required this.distance,
    required this.openTime,
    required this.price,
  });
}
