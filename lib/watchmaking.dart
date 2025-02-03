import 'package:flutter/material.dart';

class WatchmakingPage extends StatelessWidget {
  const WatchmakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchmaking'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/Watchmaking.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'The Art of Crafting Time',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'The Art of Crafting Time encapsulates the mastery and dedication required to bring timepieces to life. Each watch is a symphony of precision, where skilled artisans meticulously assemble intricate components to create a harmonious blend of form and function. From the delicate gears that dance in perfect synchrony to the elegant design that graces the wrist, every detail is meticulously crafted to stand the test of time.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'images/watchmakin1.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'In the world of watchmaking, The Art of Crafting Time is not merely about telling time; it’s about capturing moments, preserving history, and embodying timeless elegance. Every tick of the watch is a testament to the artistry and expertise poured into its creation. The hands that meticulously assemble each piece are not just craftsmen but storytellers, weaving tales of tradition and innovation into every watch they create, ensuring that each timepiece becomes a cherished heirloom for generations to come.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'images/old.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'In each and every domain, we observe, understand and support human movement, from the most intrepid to the most day to day. And we adapt our watch casings and calibers to it, from the most pared-down to the most elaborate. To us, these mechanics, human and horological, work hand in hand.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}