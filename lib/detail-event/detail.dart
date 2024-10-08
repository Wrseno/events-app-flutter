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
      title: 'Polivent App - Detail Event',
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
                          height: 300,
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
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0), // Updated padding(16.0),
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
                                fontWeight: FontWeight.w800,
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
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.place_outlined, color: primaryColor),
                          SizedBox(width: 8),
                          Text(
                            location,
                            style: TextStyle(
                              fontFamily: 'Inter', // Set font to Inter
                              fontSize: 14, // Set font size to 13
                              fontWeight:
                                  FontWeight.w500, // Medium weight (w500)
                              color:
                                  Colors.grey[600], // Optionally set text color
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.event_outlined, color: primaryColor),
                          SizedBox(width: 8),
                          Text(
                            dateTime,
                            style: TextStyle(
                              fontFamily: 'Inter', // Set font to Inter
                              fontSize: 14, // Set font size to 13
                              fontWeight:
                                  FontWeight.w500, // Medium weight (w500)
                              color:
                                  Colors.grey[600], // Optionally set text color
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.confirmation_number_outlined,
                              color: primaryColor),
                          SizedBox(width: 8),
                          Text(
                            '$totalTickets Ticket',
                            style: TextStyle(
                              fontFamily: 'Inter', // Set font to Inter
                              fontSize: 14, // Set font size to 13
                              fontWeight:
                                  FontWeight.w500, // Medium weight (w500)
                              color:
                                  Colors.grey[600], // Optionally set text color
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

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
                                  fontSize: 14,
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
                      SizedBox(height: 8),

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
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        fullDescription,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
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
                  // Back button with semi-transparent background
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2), // Semi-transparent background
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {
                        // Aksi tombol back
                      },
                    ),
                  ),
                  Spacer(),
                  // Title "Detail Event" in the center
                  Text(
                    'Detail Event',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 20, // Font size 20 as per image
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  // Share button with semi-transparent background
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2), // Semi-transparent background
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {
                        // Aksi tombol share
                      },
                    ),
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: Colors.white,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 20,
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

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final List<Map<String, dynamic>> comments = [
    {
      "user": "User1",
      "text": "Seminar ini sangat menarik!",
      "replies": [
        {"user": "User2", "text": "Saya setuju!"},
      ]
    },
    {
      "user": "User3",
      "text": "Apakah ada sesi tanya jawab?",
      "replies": [
        {"user": "User4", "text": "Ya, sesi tanya jawab akan ada di akhir."}
      ]
    },
    {
      "user": "User5",
      "text": "Topik yang dibahas relevan dengan teknologi masa depan.",
      "replies": []
    },
  ];

  final TextEditingController _newCommentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();

  void _addComment() {
    if (_newCommentController.text.isNotEmpty) {
      setState(() {
        comments.add({
          "user": "NewUser", // Placeholder for current user
          "text": _newCommentController.text,
          "replies": []
        });
        _newCommentController.clear();
      });
    }
  }

  void _addReply(int index) {
    if (_replyController.text.isNotEmpty) {
      setState(() {
        comments[index]['replies'].add({
          "user": "ReplyUser", // Placeholder for reply user
          "text": _replyController.text
        });
        _replyController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display comments and their replies
        ...comments.map((comment) {
          int index = comments.indexOf(comment);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(255, 191, 28, 1),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment['user'], // Display user name or title
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            comment['text'],
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Open reply input field
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    controller:
                                                        _replyController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Type your reply...',
                                                      hintStyle: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey
                                                            .withOpacity(0.7),
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      _addReply(index);
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.send,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Reply',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontFamily: 'Inter',
                              ),
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
              // Display replies
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  children: comment['replies']
                      .map<Widget>((reply) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(255, 191, 28, 1),
                                  child:
                                      Icon(Icons.person, color: Colors.white),
                                  radius: 16,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reply[
                                            'user'], // Display reply user name
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        reply['text'],
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        }).toList(),

        SizedBox(height: 16),

        // Add new comment input field (rounded with short height)
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _newCommentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _addComment,
                    icon: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
