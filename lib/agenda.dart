import 'package:flutter/material.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  int? expandedCardIndex;
  int selectedDay = 1;
  late List<List<SessionData>> sessionsByDay;

  @override
  void initState() {
    super.initState();
    // Initialize session data for each day
    sessionsByDay = [
      // Day 1 sessions
      [
        SessionData(
          speakerName: "John Doe",
          designation: "Senior Engineer",
          companyName: "Tech Corp",
          sessionTitle: "Implementing Asset Performance Management for Day 1",
          time: "9:30AM TO 10:00AM",
        ),
        SessionData(
          speakerName: "John Doe",
          designation: "Senior Engineer",
          companyName: "Tech Corp",
          sessionTitle: "Implementing Asset Performance Management for Day 1",
          time: "9:30AM TO 10:00AM",
        ),
        SessionData(
          speakerName: "John Doe",
          designation: "Senior Engineer",
          companyName: "Tech Corp",
          sessionTitle: "Implementing Asset Performance Management for Day 1",
          time: "9:30AM TO 10:00AM",
        ),
        SessionData(
          speakerName: "John Doe",
          designation: "Senior Engineer",
          companyName: "Tech Corp",
          sessionTitle: "Implementing Asset Performance Management for Day 1",
          time: "9:30AM TO 10:00AM",
        ),
        // Add more sessions for Day 1
      ],
      // Day 2 sessions
      [
        SessionData(
          speakerName: "Jane Smith",
          designation: "Project Manager",
          companyName: "Innovation Inc",
          sessionTitle: "Optimizing Plant Operations for Day 2",
          time: "10:00AM TO 10:30AM",
        ),
        SessionData(
          speakerName: "Jane Smith",
          designation: "Project Manager",
          companyName: "Innovation Inc",
          sessionTitle: "Optimizing Plant Operations for Day 2",
          time: "10:00AM TO 10:30AM",
        ),
        SessionData(
          speakerName: "Jane Smith",
          designation: "Project Manager",
          companyName: "Innovation Inc",
          sessionTitle: "Optimizing Plant Operations for Day 2",
          time: "10:00AM TO 10:30AM",
        ),
        SessionData(
          speakerName: "Jane Smith",
          designation: "Project Manager",
          companyName: "Innovation Inc",
          sessionTitle: "Optimizing Plant Operations for Day 2",
          time: "10:00AM TO 10:30AM",
        ),
        // Add more sessions for Day 2
      ],
      // Day 3 sessions
      [
        SessionData(
          speakerName: "Bob Johnson",
          designation: "Chief Technology Officer",
          companyName: "Future Systems",
          sessionTitle: "Next-Gen Asset Management for Day 3",
          time: "9:00AM TO 9:30AM",
        ),
        SessionData(
          speakerName: "Bob Johnson",
          designation: "Chief Technology Officer",
          companyName: "Future Systems",
          sessionTitle: "Next-Gen Asset Management for Day 3",
          time: "9:00AM TO 9:30AM",
        ),
        SessionData(
          speakerName: "Bob Johnson",
          designation: "Chief Technology Officer",
          companyName: "Future Systems",
          sessionTitle: "Next-Gen Asset Management for Day 3",
          time: "9:00AM TO 9:30AM",
        ),
        SessionData(
          speakerName: "Bob Johnson",
          designation: "Chief Technology Officer",
          companyName: "Future Systems",
          sessionTitle: "Next-Gen Asset Management for Day 3",
          time: "9:00AM TO 9:30AM",
        ),
        // Add more sessions for Day 3
      ],
    ];
  }

  void updateSelectedDay(int day) {
    setState(() {
      selectedDay = day;
      expandedCardIndex = null; // Reset expanded card when changing day
    });
  }

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
            DaySelector(
              selectedDay: selectedDay,
              onDaySelected: updateSelectedDay,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sessionsByDay[selectedDay - 1].length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (expandedCardIndex == index) {
                        expandedCardIndex = null;
                      } else {
                        expandedCardIndex = index;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: expandedCardIndex == index ? 300 : 150,
                    child: SessionCard(
                      isExpanded: expandedCardIndex == index,
                      sessionData: sessionsByDay[selectedDay - 1][index],
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

class DaySelector extends StatelessWidget {
  final int selectedDay;
  final Function(int) onDaySelected;

  const DaySelector({
    Key? key,
    required this.selectedDay,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 1; i <= 3; i++)
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: selectedDay == i ? Colors.white : Colors.brown,
              backgroundColor:
                  selectedDay == i ? Colors.brown : Colors.transparent,
              side: const BorderSide(color: Colors.brown),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => onDaySelected(i),
            child: Text('DAY $i'),
          ),
      ],
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

class SessionCard extends StatelessWidget {
  final bool isExpanded;
  final SessionData sessionData;
  final double avatarRadius = 56.0;

  const SessionCard({
    Key? key,
    required this.isExpanded,
    required this.sessionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isExpanded)
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [HexColor('560bad'), HexColor('c13584')],
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
                      sessionData.sessionTitle,
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
                                sessionData.speakerName,
                                style: TextStyle(
                                  color: HexColor('FFFFFF'),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                sessionData.designation,
                                style: TextStyle(
                                  color: HexColor('FFFFFF'),
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                sessionData.companyName,
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
                          backgroundImage: const AssetImage('images/arb.png'),
                          backgroundColor: HexColor('8e3913'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          ClipPath(
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
                          sessionData.time,
                          style: TextStyle(
                            color: HexColor('006055'),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(width: 56),
                      ],
                    ),
                    Text(
                      sessionData.speakerName,
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
                          child: Text(
                            sessionData.sessionTitle,
                            style: const TextStyle(fontSize: 11),
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

class SessionData {
  final String speakerName;
  final String designation;
  final String companyName;
  final String sessionTitle;
  final String time;

  SessionData({
    required this.speakerName,
    required this.designation,
    required this.companyName,
    required this.sessionTitle,
    required this.time,
  });
}
