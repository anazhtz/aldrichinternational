import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class FloorPlanScreen extends StatefulWidget {
  const FloorPlanScreen({super.key});

  @override
  _FloorPlanScreenState createState() => _FloorPlanScreenState();
}

class _FloorPlanScreenState extends State<FloorPlanScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {}; // To store markers on the map
  TextEditingController _searchController = TextEditingController();
  
  // Example LatLng coordinates for the center of the map
  static const LatLng _center = LatLng(37.42796133580664, -122.085749655962);

  // Function to handle map creation
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    // Add a marker at the center position initially
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('center_marker'),
          position: _center,
          infoWindow: InfoWindow(title: 'Center Marker'),
        ),
      );
    });
  }

  // Function to search and display the location
  Future<void> _searchLocation(String location) async {
    List<Location> locations = await locationFromAddress(location);
    if (locations.isNotEmpty) {
      // Clear existing markers
      setState(() {
        _markers.clear();
      });

      // Get the first location from the search
      Location newLocation = locations.first;

      // Move the camera to the new location
      _mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(newLocation.latitude, newLocation.longitude)));

      // Add a marker for the new location
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('searched_location'),
            position: LatLng(newLocation.latitude, newLocation.longitude),
            infoWindow: InfoWindow(title: location),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          // Google Map widget
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            markers: _markers, // Display markers on the map
            minMaxZoomPreference: MinMaxZoomPreference(0.5, 4.0), // Set min and max zoom levels
          ),

          // Positioned search bar styled similar to the one in the image
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController, // Set the controller
                decoration: InputDecoration(
                  hintText: 'Booth Number / Company Name',
                  hintStyle: const TextStyle(color: Colors.brown), // Hint text color brown
                  filled: true,
                  fillColor: Colors.white, // Background color white
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20), // Added horizontal padding to move hint text inside
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
                  // Call the search function when the user submits the text
                  _searchLocation(value);
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
                borderRadius: BorderRadius.circular(10), // Set border radius to 10
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
                      _mapController.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
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
                      _mapController.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
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
