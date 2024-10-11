import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  final Color borderColor;   // Parameter for border color
  final Color textColor;     // Parameter for speaker name text color
  final Color textColortime; // Parameter for time text color

  const SessionCard({
    super.key,
    this.borderColor = const Color.fromARGB(255, 129, 60, 5), // Default brown
    this.textColor = const Color.fromARGB(255, 129, 60, 5),  // Default brown for text
    required this.textColortime,  // Time text color must be passed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Adjust width to match the design
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.all(12.0), // Adjust padding for a neater look
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor, // Use the passed color for the border
          width: 1.5, // Border thickness
        ),
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Column(
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
                        color: textColor, // Use the passed text color
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ensuring a Predictable Plant By Implementing Proper Asset Performance Management',
                      style: TextStyle(
                        fontSize: 14, // Adjust text size for subtitle
                        color: Colors.black, // Standard dark color for text
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '9:30AM TO 10:00AM',
                      style: TextStyle(
                        fontSize: 14,
                        color: textColortime, // Use the passed time text color
                        fontWeight: FontWeight.w500, // Bold for emphasis
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const CircleAvatar(
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
