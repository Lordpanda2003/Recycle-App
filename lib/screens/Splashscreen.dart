import 'package:flutter/material.dart';
// ==============================================================================
// SPLASH SCREEN
// Displays the app logo and name, then navigates to onboarding after a delay.
// ==============================================================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  // Navigates to the onboarding screen after a short delay
  _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3), () {}); // 3-second delay
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/onboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for Runtahpedia Logo Image
            // To use your actual logo:
            // 1. Place your logo file (e.g., 'runtahpedia_logo.png') into an 'assets/images/' folder.
            // 2. Add 'assets/images/' to your pubspec.yaml under the 'flutter: assets:' section.
            // 3. Replace Image.network with Image.asset('assets/images/runtahpedia_logo.png').
            Image.asset(
              'assets/images/recycling_logo.jpeg', // Placeholder image for logo
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.recycling, // Fallback icon if logo fails to load
                  size: 100,
                  color: Color(0xFF00C7B0),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'RECYCLE APP',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF28B446), // Green color for the app name
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF28B446)), // Green spinner
            ),
          ],
        ),
      ),
    );
  }
}