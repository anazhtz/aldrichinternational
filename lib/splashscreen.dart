import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:aldrichinternational/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rightToLeftController;
  late Animation<Offset> _slideUpAnimation;
  late Animation<Offset> _waterDropSlideAnimation;
  late Animation<Offset> _rightToLeftAnimation;

  @override
  void initState() {
    super.initState();

    // Controller for sliding up and water drop animations
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // New controller for right-to-left animation
    _rightToLeftController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Slide the industrial logo up
    _slideUpAnimation =
        Tween<Offset>(begin: const Offset(0, 8), end: Offset.zero).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );

    // Waterdrop sliding down from the top
    _waterDropSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: Offset.zero).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    // Mecoc logo sliding from right to left
    _rightToLeftAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _rightToLeftController, curve: Curves.easeOut),
    );

    // Start both animations
    _slideController.forward();
    _rightToLeftController.forward();

    // Navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Uncomment to navigate to HomeScreen
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rightToLeftController.dispose();
    super.dispose();
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
            const SizedBox(height: 120),

            // Mecoc logo with right-to-left animation
            SlideTransition(
              position: _rightToLeftAnimation,
              child: const Image(
                image: AssetImage("images/mecoc white 2025-8 1.png"),
              ),
            ),

            const SizedBox(height: 70),

            // Main content with animated images
            Expanded(
              flex: 2,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Industrial logo sliding up from the bottom
                    Positioned(
                      bottom: 60,
                      child: SlideTransition(
                        position: _slideUpAnimation,
                        child: Image.asset(
                          'images/industrialimagelogo.png',
                          width: 200,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Static main logo at the center
                    Image.asset(
                      'images/mainlogopart.png',
                      fit: BoxFit.contain,
                    ),

                    // Waterdrop sliding down from the top
                    Positioned(
                      left: 55,
                      bottom: 50,
                      child: SlideTransition(
                        position: _waterDropSlideAnimation,
                        child: Image.asset(
                          'images/waterdrop.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Text section
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      width: 20,
                    ),
                  ),
                  FadeInLeft(
                    duration: const Duration(seconds: 1),
                    child: Column(
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
