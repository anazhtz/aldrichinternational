import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bannerImages = [
    'https://s3-alpha-sig.figma.com/img/4fe4/842b/797e53367290d82bbac1abb75090be9b?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HrHROzdV4K7AwixlyE9sG~CJ1d-v8D9bEK4Dxg5plfotodmS9lspm0pN6xklW~vksVl1YgOHc5U-HWXfm4zLVWdVPz2Mplr39V-muJpSkR6q9LkUkhOuI99Sya83clk~y~sG6nxetwHXJAT8k0wVi7SRwQOxrEq3k4v1haksOKis2PPvNfzyIK8sMRP9xjinInDBG9FJk10ZoBU6FgTIXwmESUEfq5Iru7deFlhOCnLhFgkZENYUXrwi-m2G5ye69H9dyD8ZEQyzlPg48xcyG9Dy7goc2cpANOJNvWRsyCGR~HduPtI~HSd5VR2nPKAJXC-nrvTCg2d4fYVAaLW5Gg__',
    // Add more image URLs here
  ];

  int _currentIndex = 0; // Track the current index of the carousel
  final CarouselController _controller = CarouselController(); // Carousel controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/Screenshot 2024-10-11 105039.png', // Your logo asset
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.qr_code_scanner), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timed Image Carousel
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true, // Automatic image change
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5), // Time between images
                    viewportFraction: 0.9, // Adjusts the size of the image displayed
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index; // Update the current index
                      });
                    },
                  ),
                  carouselController: _controller,
                  items: bannerImages.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15), // Rounded corners
                          child: Image.network(
                            image,
                            fit: BoxFit.cover, // Makes sure image fills the space
                            width: 1000,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(bannerImages.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.teal : Colors.grey,
                      ),
                    );
                  }),
                ),
              ],
            ),

            // Other content like "Upcoming Sessions"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Upcoming sessions',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: const Text('View Agenda', style: TextStyle(color: Colors.teal))),
                ],
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SessionCard(),
                  SessionCard(),
                ],
              ),
            ),

            // Sponsors & Partners
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('Sponsors & Partners',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SponsorLogo(),
                  SponsorLogo(),
                  SponsorLogo(),
                ],
              ),
            ),

            // Day 1 Highlights
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('DAY 1 Highlights',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.brown,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// Placeholder widget for session cards
class SessionCard extends StatelessWidget {
  const SessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/100'),
          ),
          const SizedBox(height: 10),
          const Text('Speaker name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text(
              'Ensuring a Predictable Plant By Implementing Proper Asset Performance Management'),
          const SizedBox(height: 5),
          Text('9:30AM TO 10:00AM',
              style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}

// Placeholder widget for sponsor logos
class SponsorLogo extends StatelessWidget {
  const SponsorLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network('https://via.placeholder.com/80x40'); // Sponsor logo
  }
}
