import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/screens/ResetPasswordPage.dart';
import 'package:recycle_app/screens/SuccessPage.dart';

import 'screens/search_screen.dart';
import 'screens/LoginPage_screen.dart';
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
        // home: const LocationDetailScreen(name: 'Centre CETIC', description: '', imageUrl: 'https://www.ashevillenc.gov/wp-content/uploads/2018/10/Depositphotos_189750556_xl-2015.jpg', location: LatLng(3.8494881127188076, 11.519551203064225), distance: '20mi away', openTime: '1AM-5PM', price: 'Free',),
        home: LoginPage(),
    );
  }
}