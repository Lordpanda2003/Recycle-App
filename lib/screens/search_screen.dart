import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/location_model.dart';
import 'location_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();

  final List<Location> _allLocations = [
     Location(
    name: "Marché Central",
    description: "Centre névralgique pour les produits recyclables.",
    imageUrl: "https://via.placeholder.com/400",
    latLng: const LatLng(3.8667, 11.5167),
    distance: "2 km",
    openTime: "8h - 18h",
    price: "Gratuit",
  ),
  Location(
    name: "Mont Fébé Recyclage",
    description: "Zone de tri des déchets organiques et plastiques.",
    imageUrl: "https://via.placeholder.com/400",
    latLng: const LatLng(3.8998, 11.4786),
    distance: "5 km",
    openTime: "9h - 17h",
    price: "1 000 FCFA",
  ),
  Location(
    name: "Université de Yaoundé I - Point Vert",
    description: "Collecte des papiers et équipements électroniques.",
    imageUrl: "https://via.placeholder.com/400",
    latLng: const LatLng(3.8675, 11.4994),
    distance: "3 km",
    openTime: "8h - 16h",
    price: "500 FCFA",
  ),
  Location(
    name: "Etoa-Meki Recyclage",
    description: "Centre communautaire de recyclage local.",
    imageUrl: "https://via.placeholder.com/400",
    latLng: const LatLng(3.8799, 11.5074),
    distance: "1.5 km",
    openTime: "7h - 19h",
    price: "Gratuit",
  ),
  ];

  List<Location> _filteredLocations = [];
  final Set<Marker> _markers = {};
  static const LatLng _initialPosition = LatLng(3.8667, 11.5167); // Yaoundé centre


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _addMarkers();
  }

  void _addMarkers() {
    _markers.clear();
    for (var loc in _allLocations) {
      _markers.add(
        Marker(
          markerId: MarkerId(loc.name),
          position: loc.latLng,
          infoWindow: InfoWindow(title: loc.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LocationDetailScreen(location: loc)),
            );
          },
        ),
      );
    }
    setState(() {});
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredLocations = _allLocations
          .where((loc) => loc.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _selectLocation(Location loc) {
    _mapController.animateCamera(CameraUpdate.newLatLngZoom(loc.latLng, 14));
    _searchController.text = loc.name;
    _filteredLocations = [];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LocationDetailScreen(location: loc)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _initialPosition,
              zoom: 10,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Search location...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                if (_filteredLocations.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Column(
                      children: _filteredLocations
                          .map((loc) => ListTile(
                                title: Text(loc.name),
                                onTap: () => _selectLocation(loc),
                              ))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
