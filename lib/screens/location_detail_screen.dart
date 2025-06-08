import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/location_model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationDetailScreen extends StatelessWidget {
  final Location location;

  const LocationDetailScreen({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Location> nearbyLocations = [
      Location(
    name: "Yaoundé Bois recyclé",
    description: "Collecte de bois usé pour réutilisation.",
    imageUrl: "https://i.imgur.com/ZoYbWjh.jpg",
    latLng: const LatLng(3.8600, 11.5200),
    distance: "0.8 km",
    openTime: "8h - 17h",
    price: "500 FCFA",
  ),
  Location(
    name: "Recyclage Mvog-Mbi",
    description: "Collecte de plastique et métaux.",
    imageUrl: "https://i.imgur.com/kcKydu2.jpg",
    latLng: const LatLng(3.8615, 11.5300),
    distance: "1.2 km",
    openTime: "9h - 18h",
    price: "Variable",
  ),
  Location(
    name: "Compost Ahala",
    description: "Déchets organiques et compost gratuit.",
    imageUrl: "https://i.imgur.com/XVLW71I.jpg",
    latLng: const LatLng(3.8420, 11.4800),
    distance: "6 km",
    openTime: "7h - 15h",
    price: "Gratuit",
  ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.network(
              location.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 48, color: Colors.grey),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(location.name,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Text(location.distance,
                            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text("Information about ${location.name}",
                        style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 20, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(location.openTime),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.attach_money, size: 20, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text(location.price),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(location.description),
                    const SizedBox(height: 20),
                    const Text("Nearby locations",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ...nearbyLocations.map((loc) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LocationDetailScreen(location: loc),
                                ),
                              );
                            },
                            child: _buildNearbyCard(loc),
                          ),
                        )),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Activity"),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 22,
              child: Icon(Icons.camera_alt, color: Colors.white),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildNearbyCard(Location loc) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.network(loc.imageUrl, height: 100, width: 100, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loc.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(loc.distance, style: const TextStyle(color: Colors.red, fontSize: 13)),
                  Text(loc.description, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
