import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/Group 2373.png'), // Background image
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8E3914).withOpacity(0.8), // Add opacity to blend with the image
              Color(0xFF38503B).withOpacity(0.8), 
              Color(0xFF005F55).withOpacity(0.8),
            ],
            stops: [0.0, 0.605, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),

            // Wrapping the image in Expanded to ensure it fits properly
            Expanded(
              flex: 0,
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/ba04/5aa1/b967a346dec13a5a1008169a456b3edc?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=m4kBLBzcXw1pU6EXYMDaaRg5aijlMDwGm9fSp7JsUhj1uhZYVZZHy8vKdSol6FsKQyqm9MmbBqdsCCQtM7hs5KPrfLVTVOQGd4iyWCYO~aDcGVhMLKPCvBsH~D-VJx4WFIYlTT6muTaqLyXtFiAPjKoWWQp4Op7ycZlMrwomZ~nwqmyFZbSdy5I8O5OU-W0f3dEtgL6UrfmY5lDX4L1EicFUouLTAPjndhA-c7F4cq3hxc73y6io8l6~BIa~3RhYkCEjuYiKtbRSb-9GHKP9hMCECdolyLR0lMtzwIcL6mGOJwdJpNpW3n2BXDgXZX4cjCnkD58rUb1Emp5OSSCzDA__',
                width: double.infinity,
                fit: BoxFit.cover, // Ensures the image covers the available space
              ),
            ),

            // Middle Section (Logo/Graphic)
            Center(
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/1440/0996/c483e2b8be86dd054d3da002beb1c697?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BQg0dCeCsXJqA713aytvC4rHcjOGapCApHeSR5BUbFEOrwJ1CkfHvMr2yGgAA0pE4XR9LrBAyHTkmoKPZikhzpTh8duyOk4vTHjvgYJYHJEK6HzkGwnmeB2Hl45l06H6Xi6sJRwG4BHUg1dqqsdWyw~STB6mmh41I5UXbNvTYInx3QyQRo8cOzVaDSqyl1g~oiz3r7Mri1oQEWXtoNcGjy0gXHgj6tZms~nXg~YHuALTYeKJnUzNjVhKaq3jJbjcYf5l6~lX52BI3OegJuI~De7afl75g~R2VYVEWt-HtUg2ldSJe7oEiiEOOYXhFftu0fMXAJ~AdI~bLo9OGoZpqg__',
                width: 360, // Adjust width/height as needed
                height: 350,
              ),
            ),

            // Bottom Text
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: const Column(
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
