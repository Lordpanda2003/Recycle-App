import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/screens/ResetPasswordPage.dart';
import 'package:recycle_app/screens/SuccessPage.dart';
import 'screens/RegisterPage.dart';
import 'screens/search_screen.dart';
import 'screens/LoginPage_screen.dart';
import 'screens/itinerary_screen.dart';
import 'screens/ForgotPasswordPage_screen.dart';

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
      initialRoute: '/login',
      routes: {
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/forgot': (context) => ForgotPasswordPage(),
    '/reset': (context) => ResetPasswordPage(),
    '/success': (context) => SuccessPage(),
  },
    );
  }
}