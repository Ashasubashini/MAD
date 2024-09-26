// about_page.dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add the main image at the top of the About page
            Image.asset(
              'images/AboutUsmain.jpg', // Replace with your actual image path
              width: double.infinity,  // Make the image take up the full width
              height: 250,             // You can adjust the height as needed
              fit: BoxFit.cover,        // Ensure the image covers the available space
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Queens Watch Collection',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Queens Watch Collection exudes elegance and luxury. Our timepieces are crafted with precision, attention to detail, and are the perfect accessory for those who value sophistication and style.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Founded in 1923, our collection has been a timeless companion for generations, symbolizing elegance and exclusivity.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
