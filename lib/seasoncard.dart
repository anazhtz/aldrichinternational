// SessionCard widget
import 'package:flutter/material.dart';

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
                radius: 40, // Adjust radius to make the avatar smaller
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
      margin: const EdgeInsets.all(0.0),
      child: Image.asset(
        assetName,
        fit: BoxFit.fill, // Change to fit as per your requirement
      ),
    );
  }
}
