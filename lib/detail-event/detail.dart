import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(PoliventApp());
}

// Define primary color
const Color primaryColor = Color(0xFF1886EA);
const Color secondaryColor = Color(0xFFFAAD14);

class PoliventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Techcomfest',
      theme: ThemeData(
        fontFamily: 'Inter', // Set Inter as default font
        primaryColor: primaryColor, // Use primaryColor globally
      ),
      home: PoliventDetail(),
      debugShowCheckedModeBanner: false, // Debug banner removed
    );
  }
}

class PoliventDetail extends StatefulWidget {
  @override
  _PoliventDetailState createState() => _PoliventDetailState();
}

class _PoliventDetailState extends State<PoliventDetail> {
  final String eventTitle = 'Seminar : Techcomfest';
  final String location = 'Gedung Kuliah Terpadu Lantai 2';
  final String dateTime = '12 Januari 2024 - 10:00 PM';
  final int totalTickets = 50;
  final String description =
      'Join us at Techomfest, the ultimate seminar for tech enthusiasts, innovators, and future leaders! '
      'This year’s seminar will dive deep into the latest advancements in technology, from artificial intelligence '
      'and blockchain to the Internet of Things (IoT) and cutting-edge software development.';

  final String fullDescription =
      'With renowned speakers, interactive panels, and hands-on workshops, Techomfest offers a unique opportunity to explore '
      'how technology is shaping the future across various industries. Whether you\'re a student, entrepreneur, or tech professional, '
      'this event is your gateway to new knowledge and innovation.';

  final int availableTickets = 44;

  bool isLoved = false; // State for love button interaction

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar di bagian atas dengan rounded corner dan gradient hitam
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Image_Here.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Detail seminar
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              eventTitle,
                              style: TextStyle(
                                fontSize: 20, // Title font size updated
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isLoved ? Icons.favorite : Icons.favorite_border,
                              color: isLoved ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isLoved = !isLoved; // Toggle love interaction
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.place_outlined, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(location),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.event_outlined, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(dateTime),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.confirmation_number_outlined,
                              color: Colors.grey),
                          SizedBox(width: 8),
                          Text('$totalTickets Ticket'),
                        ],
                      ),
                      SizedBox(height: 16),

                      Divider(color: Colors.grey[300], thickness: 1),

                      // Organizer Info
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 20,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UKM PCC',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Text(
                                'Organizer',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Divider(color: Colors.grey[300], thickness: 1),
                      SizedBox(height: 16),

                      // Descriptions
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        fullDescription,
                        style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                      ),
                      SizedBox(height: 16),

                      // Comments section
                      Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 8),
                      CommentSection(),
                      SizedBox(
                          height: 100), // Padding tambahan untuk bagian bawah
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom AppBar dengan tombol Back, Title, dan Share
          Positioned(
            top: 0, // Fixed position at top
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                children: [
                  // Tombol Back
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () {
                      // Aksi tombol back
                    },
                  ),
                  Spacer(),
                  // Judul di tengah
                  Text(
                    'Detail Event',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24, // Title font size 20
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Spacer(),
                  // Tombol Share
                  IconButton(
                    icon: Icon(Icons.share_outlined, color: Colors.white),
                    onPressed: () {
                      // Aksi tombol share
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bagian bawah dengan tombol "Join"
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              color: Colors.white,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFAAD14),
                        ),
                      ),
                      Text(
                        '$availableTickets Tickets Left',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Rounded rectangle background with 20% opacity
                      Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                          // color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol join diklik
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              primaryColor, // Use primary blue color
                          minimumSize: Size(200, 60), // Updated button size
                        ),
                        child: Text(
                          'Join',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
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

class CommentSection extends StatelessWidget {
  final List<String> comments = [
    "Seminar ini sangat menarik!",
    "Apakah ada sesi tanya jawab?",
    "Topik yang dibahas relevan dengan teknologi masa depan.",
    "Saya sudah mendaftar! Tidak sabar untuk hadir.",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comments
          .map(
            (comment) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFB6C9DB),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment),
                        GestureDetector(
                          onTap: () {
                            // Aksi ketika tombol reply diklik
                          },
                          child: Text(
                            'Reply',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '2h ago', // Placeholder for time
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
