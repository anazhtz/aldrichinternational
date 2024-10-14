import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:aldrichinternational/agenda.dart';
import 'package:aldrichinternational/search_screen.dart';
import 'package:aldrichinternational/seasoncard.dart';

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

  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.2);
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
    _removeOverlay();
    super.dispose();
  }

  void _onCarouselChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showBadgeOverlay() {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => BadgeOverlay(onDismiss: _removeOverlay),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
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
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _showBadgeOverlay,
                          child: Image.asset(
                            "images/Frame 28.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        IconButton(
                          iconSize: 30,
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
                            width: 40,
                            height: 40,
                          ),
                        ),
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
                        _onCarouselChanged(index);
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
                        width: _currentIndex == index ? 12.0 : 8.0,
                        height: _currentIndex == index ? 12.0 : 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.teal
                              : Colors.grey,
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AgendaScreen()),
                            );
                          },
                          child: const Text(
                            'View Agenda',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w500,
                            ),
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
                    SessionCards(
                      textColortime: Color.fromARGB(255, 162, 55, 5),
                    ),
                    SessionCards(
                      borderColor: Colors.teal,
                      textColor: Colors.teal,
                      textColortime: Colors.teal,
                    ),
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
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
            _currentIndex = index;
            if (index == 1) {
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

class BadgeOverlay extends StatelessWidget {
  final VoidCallback onDismiss;

  const BadgeOverlay({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.brown),
                          onPressed: onDismiss,
                        ),
                        Text(
                          'Badge',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        SizedBox(width: 48), // To balance the close button
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFBF6336),
                              Color(0xFF0D7460),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'TECHNICAL \n CHAIRMAN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  'images/qrapp.png',
                                  height: 200,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Sharul A. Rashid',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Group Technical Authority & Custodian\n'
                                'Engineer - Instrument & Control',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'ARAMCO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SponsorLogo extends StatelessWidget {
  final String assetName;

  const SponsorLogo({Key? key, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      fit: BoxFit.contain,
    );
  }
}
