import 'package:flutter/material.dart';


class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  int? expandedCardIndex; // Track the currently expanded card index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: const Text(
          'Agenda',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(height: 16),
            const TrackSelector(),
            const SizedBox(height: 16),
            const DaySelector(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (expandedCardIndex == index) {
                        expandedCardIndex = null; // Collapse if tapped again
                      } else {
                        expandedCardIndex = index; // Expand this card
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height:
                        expandedCardIndex == index ? 300 : 150, // Expanded size
                    child: Stack(
                      children: [
                        SessionCard(isExpanded: expandedCardIndex == index),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.brown),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TrackSelector extends StatelessWidget {
  const TrackSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'TRACK 1',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal,
              side: const BorderSide(color: Colors.teal),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text('TRACK 2', style: TextStyle(color: Colors.teal)),
          ),
        ),
      ],
    );
  }
}

class DaySelector extends StatelessWidget {
  const DaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.brown,
            side: const BorderSide(color: Colors.brown),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text('DAY 1'),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.brown,
            side: const BorderSide(color: Colors.brown),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text('DAY 2'),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.brown,
            side: const BorderSide(color: Colors.brown),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text('DAY 3'),
        ),
      ],
    );
  }
}

class SessionCard extends StatelessWidget {
  final bool isExpanded;
  final double avatarRadius = 56.0;

  const SessionCard({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isExpanded
            ? Container(
                height: 300, // Fixed height for expanded state
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFe5e0e5),
                      Color(0xFF722f5e),
                      Color(0xFFa786a0),
                      Color(0xFF936c76),
                      Color(0xFFaea2b3),
                      Color(0xFF262325),
                      Color(0xFF4b3460),
                      Color(0xFFa25476),
                      Color(0xFF5f2c25),
                      Color(0xFFa494b8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                margin: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'SESSION',
                                style: TextStyle(
                                  color: HexColor('FFFFFF'),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'NOTIFY ME',
                                  style: TextStyle(
                                    color: HexColor('FFFFFF'),
                                    fontSize: 11,
                                  ),
                                ),
                                Icon(Icons.notifications,
                                    color: HexColor('FFFFFF'), size: 16),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Ensuring A Predictable Plant By Implementing Proper Asset Performance Management',
                          style: TextStyle(
                            color: HexColor('FFFFFF'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Speaker name',
                                    style: TextStyle(
                                      color: HexColor('FFFFFF'),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Designation',
                                    style: TextStyle(
                                      color: HexColor('FFFFFF'),
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Company name',
                                    style: TextStyle(
                                      color: HexColor('FFFFFF'),
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: avatarRadius,
                              backgroundImage:
                                  const AssetImage('assets/files/arb.png'),
                              backgroundColor: HexColor('8e3913'),
                            ),
                          ],
                        ),
                        // Add more content here if needed
                      ],
                    ),
                  ),
                ),
              )
            : ClipPath(
                clipper: CardClipper(avatarRadius: avatarRadius),
                child: Card(
                  elevation: 0,
                  color: HexColor('e5efee'),
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SESSION',
                              style: TextStyle(
                                color: HexColor('006055'),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '9:30AM TO 10:00AM',
                              style: TextStyle(
                                color: HexColor('006055'),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(width: 56),
                          ],
                        ),
                        Text(
                          'Speaker name',
                          style: TextStyle(
                            color: HexColor('8e3913'),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
                              width: constraints.maxWidth - avatarRadius,
                              child: const Text(
                                'Ensuring A Predictable Plant By Implementing Proper Asset Performance Management',
                                style: TextStyle(fontSize: 11),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        if (!isExpanded)
          Positioned(
            right: 8,
            bottom: 20,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: HexColor('8e3913'),
            ),
          ),
      ],
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  final double avatarRadius;

  CardClipper({required this.avatarRadius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - avatarRadius, 0)
      ..arcToPoint(
        Offset(size.width - avatarRadius, size.height),
        radius: Radius.circular(avatarRadius),
        clockwise: false,
      )
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
