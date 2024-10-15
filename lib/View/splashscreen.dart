import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aldrichinternational/homescreen.dart';
import 'package:animate_do/animate_do.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Uncomment the following line to navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/Group 2373.png'), // Background image
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF8E3914).withOpacity(0.8),
              const Color(0xFF38503B).withOpacity(0.8),
              const Color(0xFF005F55).withOpacity(0.8),
            ],
            stops: const [0.0, 0.605, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top image with animation
              SlideInRight(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset(
                    'images/mecoc white 2025-8 1.png', // Replace with your image path
                    height: 280,
                    width: 280,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(
                  height: 5), // Adjust space between top image and GIF

              // Center the GIF
              Expanded(
                child: Center(
                  child: Image.asset(
                    'images/Black Logo Speed_2.gif',
                    height: 350, // Increased height
                    width: 350, // Increased width
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 50), // Space before the text section

              // Text Section with both animations
              SlideInLeft(
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0, left: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 75,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 2,
                          width: 20,
                        ),
                      ),
                      const SizedBox(width: 8), // Add a SizedBox for spacing
                      // SlideInLeft for text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NON-METALLIC MATERIALS",
                            style: GoogleFonts.righteous(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Text(
                            "CORROSION AND COATINGS\nFUTURE STEEL",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.righteous(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
