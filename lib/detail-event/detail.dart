import 'package:flutter/material.dart';

void main() {
  runApp(TechcomfestApp());
}

class TechcomfestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Techcomfest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TechcomfestDetail(),
    );
  }
}

class TechcomfestDetail extends StatelessWidget {
  final String seminarTitle = 'Seminar : Techcomfest';
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

  final int availableTickets = 45;

  // Daftar komentar
  final List<String> comments = [
    "Seminar ini sangat menarik!",
    "Apakah ada sesi tanya jawab?",
    "Topik yang dibahas relevan dengan teknologi masa depan.",
    "Saya sudah mendaftar! Tidak sabar untuk hadir.",
  ];

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
                // Gambar di bagian atas
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Image_Here.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Detail seminar
                      Text(
                        seminarTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 8),
                          Text(location),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8),
                          Text(dateTime),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.confirmation_number),
                          SizedBox(width: 8),
                          Text('$totalTickets Ticket'),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        fullDescription,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      // Bagian Komentar
                      Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Daftar Komentar
                      Column(
                        children: comments
                            .map((comment) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.comment, color: Colors.grey),
                                      SizedBox(width: 8),
                                      Expanded(child: Text(comment)),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 100), // Padding tambahan untuk bagian bawah
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom AppBar dengan tombol Back, Title, dan Share
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Tombol Back
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                // Tombol Share
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white),
                  onPressed: () {
                    // Aksi tombol share
                  },
                ),
              ],
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
                  Text(
                    'Free',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol join diklik
                    },
                    child: Text('Join'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
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
