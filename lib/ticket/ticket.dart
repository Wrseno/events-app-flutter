import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticket App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ETicketScreen(),
    );
  }
}

class ETicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Ticket'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ETicketCard(
            eventName: 'Seminar : Techcomfest',
            speakerName: 'Wisata Syahdan',
            imagePath: 'assets/speaker_image.jpg',
            attendeeName: 'Atsilla Arya',
            eventTime: '9:00 PM',
            eventDate: 'Jan 12 2024',
            seat: 'Open seating',
            ticketId: 'PTX23121',
          ),
          SizedBox(height: 20),
          ETicketCard(
            eventName: 'Workshop : Training Basic',
            imagePath: 'assets/workshop_image.jpg',
            attendeeName: 'Atsilla Arya',
            eventTime: '9:00 PM',
            eventDate: 'Jan 20 2024',
            seat: 'Open seating',
            ticketId: 'PTX23122',
          ),
        ],
      ),
    );
  }
}

class ETicketCard extends StatelessWidget {
  final String eventName;
  final String speakerName;
  final String imagePath;
  final String attendeeName;
  final String eventTime;
  final String eventDate;
  final String seat;
  final String ticketId;

  ETicketCard({
    required this.eventName,
    this.speakerName = '',
    required this.imagePath,
    required this.attendeeName,
    required this.eventTime,
    required this.eventDate,
    required this.seat,
    required this.ticketId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                if (speakerName.isNotEmpty)
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'SPEAKER\n$speakerName',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Text(attendeeName),
                        SizedBox(height: 10),
                        Text('Date'),
                        Text(eventDate),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time'),
                        Text(eventTime),
                        SizedBox(height: 10),
                        Text('Seat'),
                        Text(seat),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Ticket ID - $ticketId'),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    // Replace this with actual QR code generation
                    child: Center(child: Text('QR Code', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}