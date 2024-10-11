import 'dart:async';
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
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        'images/Screenshot 2024-10-11 105039.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "images/Frame 28.png",
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Color.fromARGB(252, 121, 42, 5),
                          ),
                          onPressed: () {},
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Image.asset("images/Frame 26.png"))
                      ],
                    ),
                  ],
                ),
              ),

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
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  // Dot Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bannerImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 8.0,
                        height: 8.0,
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
                height: 70, // Adjust height for the sponsor section
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: sponsorImages.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 150, // Set specific width for each logo container
                      child: SponsorLogo(assetName: sponsorImages[index]),
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
          });
        },
      ),
    );
  }
}

// SessionCard widget
class SessionCard extends StatelessWidget {
  final Color borderColor; // New parameter for border color

  const SessionCard(
      {super.key,
      this.borderColor =
          const Color.fromARGB(255, 129, 60, 5)}); // Default to brown

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Adjust width to match the design
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.all(12.0), // Adjust padding for a neater look
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor, // Use the passed color
          width: 1.5, // Border thickness
        ),
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Speaker name',
                      style: TextStyle(
                        fontSize: 18, // Slightly bigger text for speaker name
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                            255, 129, 60, 5), // Brown color for title
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ensuring a Predictable Plant By Implementing Proper Asset Performance Management',
                      style: TextStyle(
                        fontSize: 14, // Adjust text size for subtitle
                        color: Colors.black, // Standard dark color for text
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '9:30AM TO 10:00AM',
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            Color.fromARGB(255, 162, 76, 5), // Orange time text
                        fontWeight: FontWeight.w500, // Bold for emphasis
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 35, // Adjust radius to make the avatar smaller
                backgroundImage: AssetImage('images/Ellipse 4.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// SponsorLogo widget
class SponsorLogo extends StatelessWidget {
  final String assetName;

  const SponsorLogo({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Image.asset(
        assetName,
        fit: BoxFit.contain,
      ),
    );
  }
}
