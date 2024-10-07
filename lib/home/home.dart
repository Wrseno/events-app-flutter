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
      routes: {
        '/event-detail': (context) => EventDetailScreen(),
      },
    );
  }
}

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  String selectedCategory = '';

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/appbar_home.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Atsiila Arya 👋',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 4),
            Text(
              "Let's explore the event!",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.white70),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(232),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search event',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15), // Mengatur padding vertikal
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Filter action
                    },
                    icon: Icon(Icons.filter_list, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Event Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('Explore'),
              onTap: () {
                // Navigate to explore
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('My Events'),
              onTap: () {
                // Navigate to My Events
              },
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('Tickets'),
              onTap: () {
                // Navigate to Tickets
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Navigate to Profile
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Perubahan dilakukan di bagian ini
              SizedBox(
                height: 60, // Sesuaikan tinggi agar pas
                child: ListView(
                  scrollDirection: Axis.horizontal, // Ubah menjadi horizontal
                  children: [
                    CategoryChip(
                      label: 'Seminar',
                      isSelected: selectedCategory == 'Seminar',
                      onSelected: () => _selectCategory('Seminar'),
                    ),
                    SizedBox(width: 10), // Tambah jarak antar chip
                    CategoryChip(
                      label: 'Competition',
                      isSelected: selectedCategory == 'Competition',
                      onSelected: () => _selectCategory('Competition'),
                    ),
                    SizedBox(width: 10), // Tambah jarak antar chip
                    CategoryChip(
                      label: 'Workshop',
                      isSelected: selectedCategory == 'Workshop',
                      onSelected: () => _selectCategory('Workshop'),
                    ),
                    SizedBox(width: 10), // Tambah jarak antar chip
                    CategoryChip(
                      label: 'Exhibition',
                      isSelected: selectedCategory == 'Exhibition',
                      onSelected: () => _selectCategory('Exhibition'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Trending Events'),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TrendingEventCard(
                      title: 'Seminar Nasional Techcomfest 2024',
                      location: 'GKT Lt. 2',
                      date: '12 Januari 2024',
                      imageUrl: 'assets/images/event1.png',
                    ),
                    TrendingEventCard(
                      title: 'Workshop: Creative Design',
                      location: 'Jakarta, Indonesia',
                      date: '14 Februari 2024',
                      imageUrl: 'assets/images/event1.png',
                    ),
                    TrendingEventCard(
                      title: 'Exhibition: Tech Innovations',
                      location: 'Bandung, Indonesia',
                      date: '20 Maret 2024',
                      imageUrl: 'assets/images/event1.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Events Near You'),
              SizedBox(
                height: 250, // Tinggi sesuai konten
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Ubah arah scroll menjadi horizontal
                  itemCount: 5, // Dynamic based on event count
                  itemBuilder: (context, index) {
                    return EventNearYouCard(
                      title: 'Workshop: Event $index',
                      location: 'Location $index',
                      date: 'Date $index',
                      imageUrl: 'assets/images/event1.png', // Gambar yang sama dengan Trending Event
                      onTap: () {
                        Navigator.pushNamed(context, '/event-detail');
                      },
                    );
                  },
                ),
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
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: 'Ticket'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? const Color.fromARGB(255, 32, 90, 249) : const Color.fromARGB(255, 255, 255, 255),
        labelStyle: TextStyle(color: isSelected ? Colors.white : const Color.fromARGB(255, 32, 90, 249)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Buat lebih rounded
          side: BorderSide(
            color: isSelected ? const Color.fromARGB(255, 32, 90, 249) : Colors.grey, // Ubah border berdasarkan isSelected
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Sesuaikan padding agar proporsional
      ),
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
  final String imageUrl;

  const TrendingEventCard({
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.black.withOpacity(0.6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    location,
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Join'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (Colors.orange),
                      foregroundColor: (Colors.white),
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

class EventNearYouCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imageUrl;
  final VoidCallback onTap;

  const EventNearYouCard({
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, fit: BoxFit.cover),
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
      ),
    );
  }
}

class EventDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Detail'),
      ),
      body: Center(
        child: Text('Detail of the selected event goes here'),
      ),
    );
  }
}