import 'dart:async';
import 'package:aldrichinternational/search_screen.dart';
import 'package:aldrichinternational/seasoncard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> bannerImages = [
    'images/Rectangle 5.png',
    'images/Rectangle 5.png',
    'images/Rectangle 5.png',
    'images/Rectangle 5.png',
    // Add more image URLs here
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.message,
    Icons.person,
  ];

  late PageController _pageController;
  Timer? _timer;

  final List<String> sponsorImages = [
    'images/Group 2334.png',
    'images/Group 2335.png',
    'images/Group 2338.png',
    'images/Group 2337.png',
    'images/Group 2334.png',
    'images/Group 2335.png',
    'images/Group 2338.png',
    'images/Group 2337.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.2); // Adjusts the width of each item
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentIndex + 1) % sponsorImages.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentIndex = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // This method updates the current index when the page changes
  void _onCarouselChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Top Bar with Search
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        'images/Screenshot 2024-10-11 105039.png',
                        width: 180, // Increased width (e.g., 180)
                        height: 180, // Increased height (e.g., 180)
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled:
                                  true, // Allows full-screen modal sheet
                              backgroundColor:
                                  Colors.transparent, // Transparent background
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.5, // Adjust as needed
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF009688), // Starting color
                                        Color(0xFF4CAF50), // Ending color
                                      ],
                                    ),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Exit icon in the top-left
                                      Positioned(
                                        top: 20,
                                        left: 20,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the modal sheet
                                          },
                                        ),
                                      ),

                                      // Center badge icon
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          child: const Icon(
                                            Icons.badge,
                                            color: Colors.teal,
                                            size: 60, // Adjust size as needed
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            "images/Frame 28.png",
                            width: 40, // Increased size (e.g., 40)
                            height: 40, // Increased size (e.g., 40)
                          ),
                        ),
                        IconButton(
                          iconSize: 30, // Increased icon size
                          icon: const Icon(
                            Icons.notifications,
                            color: Color.fromARGB(252, 121, 42, 5),
                          ),
                          onPressed: () {},
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "images/Frame 26.png",
                            width: 40, // Increased size (e.g., 40)
                            height: 40, // Increased size (e.g., 40)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Timed Image Carousel
              // Timed Image Carousel
              Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      viewportFraction: 0.9,
                      onPageChanged: (index, reason) {
                        _onCarouselChanged(index); // Update current index
                      },
                    ),
                    items: bannerImages.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            image,
                            fit: BoxFit.fill,
                            width: 1000,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 5),
                  // Dot Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bannerImages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: _currentIndex == index
                            ? 12.0
                            : 8.0, // Increase size for active dot
                        height: _currentIndex == index
                            ? 12.0
                            : 8.0, // Increase size for active dot
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.teal
                              : Colors.grey, // Active dot color
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Upcoming Sessions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Upcoming sessions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 129, 60, 5),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'View Agenda',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_right,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SessionCard(), // Default brown border
                    SessionCard(borderColor: Colors.teal), // Teal border
                  ],
                ),
              ),

              // Sponsors & Partners
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Text(
                  'Sponsors & Partners',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 129, 60, 5),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: sponsorImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal:
                              8.0), // Add margin to create space between cards
                      child: SizedBox(
                        width: 150,
                        child: SponsorLogo(assetName: sponsorImages[index]),
                      ),
                    );
                  },
                ),
              ),

              // Day 1 Highlights
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Text(
                  'DAY 1 Highlights',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      // Floating Action Button
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.teal,
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Action for QR code scanner button
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

// Bottom Navigation Bar
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(192, 110, 36, 4),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Update the current index when an icon is tapped

            if (index == 1) {
              // Assuming the search icon is at index 1
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FloorPlanScreen()),
              );
            }
          });
        },
      ),
    );
  }
}



