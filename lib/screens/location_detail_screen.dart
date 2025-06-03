import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final LatLng location;

  const LocationDetailScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top image
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and distance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "33mi away",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      "Information about $name",
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
                    ),
                    const SizedBox(height: 12),

                    // Opening hours
                    Row(
                      children: const [
                        Icon(Icons.access_time, size: 20, color: Colors.green),
                        SizedBox(width: 8),
                        Text("Open 3pm - 11pm", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Price
                    Row(
                      children: const [
                        Icon(Icons.attach_money, size: 20, color: Colors.orange),
                        SizedBox(width: 8),
                        Text("Up to 40\$",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      description,
                      style: const TextStyle(fontSize: 15),
                    ),

                    const SizedBox(height: 20),

                    // Nearby locations section
                    const Text(
                      "Nearby locations",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    // Vertically stacked nearby cards
                    _buildNearbyCard(
                      "Walmart recycling spot",
                      "https://i.imgur.com/ZoYbWjh.jpg",
                      "33mi away",
                      "For plastic and paper waste.",
                    ),
                    const SizedBox(height: 12),
                    _buildNearbyCard(
                      "Fresno recycling location 2",
                      "https://i.imgur.com/kcKydu2.jpg",
                      "45mi away",
                      "For plastic and paper waste.",
                    ),
                    const SizedBox(height: 12),
                    _buildNearbyCard(
                      "Fresno compost location 1",
                      "https://i.imgur.com/XVLW71I.jpg",
                      "33mi away",
                      "For plastic and paper waste.",
                    ),

                    const SizedBox(height: 80), // Space for bottom bar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation bar
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

  // Card widget
  Widget _buildNearbyCard(String title, String img, String distance, String desc) {
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
            child: Image.network(
              img,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(distance, style: const TextStyle(color: Colors.red, fontSize: 13)),
                  Text(desc, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
