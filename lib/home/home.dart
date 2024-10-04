import 'package:flutter/material.dart';

void main() {
  runApp(EventApp());
}

class EventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[50],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Atsiila Arya 👋',
              style: TextStyle(color: Colors.black87, fontSize: 24),
            ),
            Text(
              "Let's explore the event!",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.black54),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search event',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Chips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryChip(label: 'Seminar'),
                  CategoryChip(label: 'Competition'),
                  CategoryChip(label: 'Workshop'),
                  CategoryChip(label: 'Exhibition'),
                ],
              ),
              SizedBox(height: 20),

              // Trending Events Section
              SectionHeader(title: 'Trending Events'),
              TrendingEventCard(
                title: 'Seminar Nasional Techcomfest 2024',
                location: 'GKT Lt. 2',
                date: '12 Januari 2024',
              ),
              SizedBox(height: 20),

              // Events Near You Section
              SectionHeader(title: 'Events Near You'),
              Row(
                children: [
                  Expanded(
                    child: EventNearYouCard(
                      title: 'Competition : Business Plan',
                      location: 'Jakarta, Indonesia',
                      date: 'July 23 2023',
                      imageUrl: 'https://example.com/business_plan_image.png',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: EventNearYouCard(
                      title: 'Workshop: Training Basic',
                      location: 'Jakarta, Indonesia',
                      date: 'December 15 2023',
                      imageUrl: 'https://example.com/training_basic_image.png',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: 'Ticket'), // Ganti Icon ticket
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue[100],
      labelStyle: TextStyle(color: Colors.blue[800]),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'See all',
          style: TextStyle(color: Colors.orange),
        ),
      ],
    );
  }
}

class TrendingEventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;

  const TrendingEventCard({
    required this.title,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(title),
        subtitle: Text('$location\n$date'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text('Join'),
        ),
      ),
    );
  }
}

class EventNearYouCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imageUrl;

  const EventNearYouCard({
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover), // Mengganti gambar dengan URL
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(location),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(date),
          ),
        ],
      ),
    );
  }
}
