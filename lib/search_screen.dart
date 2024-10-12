import 'package:flutter/material.dart';

class FloorPlanScreen extends StatefulWidget {
  const FloorPlanScreen({super.key});

  @override
  _FloorPlanScreenState createState() => _FloorPlanScreenState();
}

class _FloorPlanScreenState extends State<FloorPlanScreen> {
  TransformationController _controller = TransformationController();
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Custom back button (left-side arrow)
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 152, 44, 5),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Navigating back when pressed
          },
        ),
        title: const Text('Floor Plan',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 152, 44, 5))), // Centered title
        centerTitle: true, // Ensuring the title is centered
      ),
      body: Stack(
        children: [
          // InteractiveViewer with custom TransformationController
          InteractiveViewer(
            transformationController: _controller,
            panEnabled: true, // Enable panning
            boundaryMargin: const EdgeInsets.all(8.0),
            minScale: 0.5, // Minimum zoom out level
            maxScale: 4.0, // Maximum zoom in level
            child: Image.asset(
                'images/Map Scroll & Zoom.jpeg'), // Replace with your image
          ),

          // Positioned search bar styled similar to the one in the image
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Booth Number / Company Name',
                  hintStyle: const TextStyle(
                      color: Colors.brown), // Hint text color brown
                  filled: true,
                  fillColor: Colors.white, // Background color white
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal:
                          20), // Added horizontal padding to move hint text inside
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (value) {
                  // Handle search logic here
                  print('Searching for: $value');
                },
              ),
            ),
          ),

          // Custom Zoom In/Out Control
          Positioned(
            right: 30,
            bottom: 30,
            child: Container(
              width: 50, // Reduced width
              height: 120, // Reduced height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(10), // Set border radius to 10
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Zoom In Button
                  IconButton(
                    icon: const Icon(Icons.add,
                        size: 24, color: Colors.black), // Reduced icon size
                    onPressed: () {
                      _currentScale = _controller.value.getMaxScaleOnAxis();
                      setState(() {
                        _controller.value = _controller.value..scale(1.1);
                      });
                    },
                  ),

                  // Divider line
                  Container(
                    width: 20, // Reduced divider width
                    height: 2,
                    color: Colors.grey[400],
                  ),

                  // Zoom Out Button
                  IconButton(
                    icon: const Icon(Icons.remove,
                        size: 24, color: Colors.black), // Reduced icon size
                    onPressed: () {
                      _currentScale = _controller.value.getMaxScaleOnAxis();
                      setState(() {
                        _controller.value = _controller.value..scale(0.9);
                      });
                    },
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
