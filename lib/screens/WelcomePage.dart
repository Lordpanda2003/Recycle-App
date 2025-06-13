import 'package:flutter/material.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layout
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // White background for the entire page
      body: Stack(
        children: [
          // Background image positioned at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            // To ensure your local image displays correctly, please follow these crucial steps:
            //
            // 1. Image File Location:
            //    Create a folder named 'assets' (or 'assets/images') in the root of your Flutter project.
            //    Place your image file (e.g., 'image_24bc95.png') directly into this 'assets' folder.
            //    Example structure:
            //    your_flutter_project/
            //    ├── lib/
            //    ├── assets/
            //    │   └── image_24bc95.png  <-- Your image file here
            //    └── pubspec.yaml
            //
            // 2. pubspec.yaml Configuration:
            //    Open your 'pubspec.yaml' file.
            //    Find the 'flutter:' section and ensure it includes an 'assets:' block
            //    that points to your assets folder. Pay close attention to indentation (two spaces).
            //
            //    flutter:
            //      uses-material-design: true
            //
            //      assets:
            //        - assets/  # This line tells Flutter to include everything in the 'assets' folder
            //        # If your image is in 'assets/images/', you would use:
            //        # - assets/images/
            //
            // 3. Run 'flutter pub get':
            //    After saving changes to 'pubspec.yaml', open your terminal in the project root
            //    and run: `flutter pub get`. Your IDE might do this automatically.
            //
            // 4. Clean and Rerun (if still not working):
            //    Sometimes, the build cache can cause issues. In your terminal, run:
            //    `flutter clean`
            //    `flutter pub get`
            //    Then, restart your app: `flutter run`
            //
            // Replace 'assets/image_24bc95.png' below with the exact path to your image
            // if it's in a subfolder (e.g., 'assets/your_image_name.jpg').
            child: Image.asset(
              'assets/images/Welcom.png', // Using the previously uploaded image filename as an example
              fit: BoxFit.cover,
              height: screenSize.height * 1.1, // Covers approximately half the screen height
              errorBuilder: (context, error, stackTrace) {
                // This errorBuilder will be called if the asset image is not found or fails to load.
                // It helps in debugging by showing a message instead of a blank space.
                return Container(
                  height: screenSize.height * 0.5,
                  color: const Color.fromARGB(255, 255, 255, 255), // Placeholder color if image fails to load
                  child: const Center(
                    child: Text(
                      'Background Image Not Found (Check assets/image and pubspec.yaml)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
          // Content laid out in a column
          Column(
            mainAxisAlignment: MainAxisAlignment.end, // Aligns content to the bottom
            children: [
              SizedBox(height: screenSize.height * 0.35), // Space above the logo to position it
              // Centered logo/icon
              Center(
                child: Container(
                  padding: const EdgeInsets.all(12), // Padding around the icon
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for the logo circle
                    shape: BoxShape.circle, // Circular shape
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Subtle shadow for depth
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.recycling, // Using a recycling icon as a placeholder logo
                    color: Color(0xFF00C7B0), // Custom teal color for the icon
                    size: 60, // Size of the icon
                  ),
                ),
              ),
              const SizedBox(height: 50), // Spacing between logo and buttons

              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF28B446), // Green background color
                    foregroundColor: Colors.white, // White text color
                    minimumSize: const Size.fromHeight(55), // Full width button with fixed height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    elevation: 5, // Adds shadow
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Spacing between Login and Register buttons

              // Register Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: OutlinedButton( // Used OutlinedButton for a clear border
                 onPressed: () => Navigator.pushNamed(context, '/register'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF000000), // Green text color
                    minimumSize: const Size.fromHeight(55), // Full width button with fixed height
                    side: const BorderSide(color: Color(0xFF000000)), // Green border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    elevation: 0, // No shadow for outlined button
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Spacing between Register button and guest link

              // Continue as a guest link
              TextButton(
                onPressed: () {
                  // Action for Continue as a guest
                  // print('Continue as a guest pressed'); // For debugging
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF00C7B0), // Teal text color
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Continue as a guest',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 40), // Spacing from the bottom of the screen
            ],
          ),
        ],
      ),
    );
  }
}