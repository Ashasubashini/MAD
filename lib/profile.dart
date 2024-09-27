import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth > 600 ? 250 : double.infinity;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profilepic.jpg'),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '123 Luxury St, City',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              'Contact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '123-456-7890',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(buttonWidth, 50),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Log Out'),
                style: ElevatedButton.styleFrom(

                  minimumSize: Size(buttonWidth, 50),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
            if (index == 0) {
              Navigator.pushNamed(context, '/');  // Navigate to Home Page
            } else if (index == 1) {
              Navigator.pushNamed(context, '/cart');  // Navigate to Cart Page
            } else if (index == 2) {
              Navigator.pushNamed(context, '/profile');  // Already on Profile Page
            }
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
