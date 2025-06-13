import 'package:flutter/material.dart';
import 'package:recycle_app/models/Onboardingmodel.dart';
// ==============================================================================
// ONBOARDING PAGE WIDGET
// Renders the content for a single onboarding page.
// ==============================================================================
class OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top padding for the status bar and content
        SizedBox(height: MediaQuery.of(context).padding.top + 20),
        // Image for the onboarding page
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: AspectRatio(
            aspectRatio: 16 / 9, // Aspect ratio to maintain image proportions
            child: Image.network(
              data.imagePath,
              fit: BoxFit.contain, // Use contain to ensure full image is visible
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300], // Placeholder if image fails to load
                  child: const Center(
                    child: Text(
                      'Image Not Found',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Title of the onboarding page
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 15),
        // Description of the onboarding page
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}