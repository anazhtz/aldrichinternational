import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aldrichinternational/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Timer to delay navigation to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            const Image(image: AssetImage("images/mecoc white 2025-8 1.png")),
            const SizedBox(
              height: 70,
            ),
            // Image or logo for splash screen
            Expanded(
              flex: 2,
              child: Center(
                child: Image.asset(
                  'images/mecoc icon-8 1.png', // Use a valid image URL
                  fit: BoxFit.contain, // Adjust this to fit your needs
                ),
              ),
            ),

            // Text below the image
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Wrap VerticalDivider in a Container with a specified height
                  SizedBox(
                    height: 60, // Set an appropriate height
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      width: 20, // Space between the line and text
                    ),
                  ),
                  // Centered text with aligned columns
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NON-METALLIC MATERIALS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "CORROSION AND COATINGS\nFUTURE STEEL",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
