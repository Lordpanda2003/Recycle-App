import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'screens/PrivacyPolicyPage.dart';
import 'screens/location_detail_screen.dart';
import 'screens/itinerary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Locations App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: const LocationDetailScreen(name: 'Centre CETIC', description: '', imageUrl: 'C:\Users\MONEZE\Documents\WORK\Recycle_app\recycle_app\assets\images\iStock.jpeg', location: LatLng(3.8494881127188076, 11.519551203064225),),
       home:  PrivacyPolicyPage(),
    );
  }
}