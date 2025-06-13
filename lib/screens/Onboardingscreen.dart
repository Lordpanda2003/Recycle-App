import 'package:flutter/material.dart';
import 'package:recycle_app/models/Onboardingmodel.dart';
import 'package:recycle_app/widgets/Onboardingpage.dart';
// ==============================================================================
// ONBOARDING SCREEN
// Manages the introduction pages using a PageView.
// ==============================================================================
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data for each onboarding page
  final List<OnboardingPageData> onboardingPages = [
    OnboardingPageData(
      imagePath: 'assets/images/AdobeStock_290929282-scaled.jpeg',
      title: 'Sell Your Waste Easily',
      description: 'Sell your waste to the nearest collection points and earn rewards!',
    ),
    OnboardingPageData(
      imagePath: 'assets/images/The-Importance-of-Recycling.jpg',
      title: 'Everyone Can Recycle',
      description: 'Recycle used goods and help preserve the beauty and sustainability of our environment.',
    ),
    OnboardingPageData(
      imagePath: 'assets/images/Recycling-Bin-Crop-1024x704.jpg',
      title: 'Recycle at Nearest Locations',
      description: 'Find convenient recycling centers near you and contribute to a cleaner community.',
    ),
    OnboardingPageData(
      imagePath: 'assets/images/iStock.jpeg',
      title: 'Join Our Community',
      description: 'Become a part of the waste management movement and shape a sustainable future!',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(data: onboardingPages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button (visible from second page onwards)
                if (_currentPage > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF000000),
                        side: const BorderSide(color: Color(0xFF000000)),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Back'),
                    ),
                  )
                else
                  const Expanded(child: SizedBox.shrink()), // Hide back button on first page

                SizedBox(width: _currentPage > 0 && _currentPage < onboardingPages.length - 1 ? 16 : 0),

                // Next or Let's Get Started Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < onboardingPages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // On the last page, navigate to the login/register screen
                        Navigator.pushReplacementNamed(context, '/welcome');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF28B446),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                    ),
                    child: Text(
                      _currentPage == onboardingPages.length - 1 ? 'Let\'s Get Started' : 'Next →',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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