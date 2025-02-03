import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our History'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/History.jpg', // Replace with your main history image
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'EARLY YEARS 1956',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Step into the elegant world of Mr. George Andrews, a visionary figure in the bustling streets of 1956 Colombo, Sri Lanka. Known for his impeccable taste and refined style, Mr. Andrews\'s influence resonates through time, inspiring the luxurious essence of Queens brand. Imagine the vibrant tapestries of Colombo\'s markets, the rich scents of spices lingering in the air, and the graceful charm of a bygone era—all encapsulated in every exquisite piece offered by Queens. Join us on a journey through history and luxury, where the spirit of Mr. George Andrews lives on in each handcrafted creation, embodying sophistication and timeless elegance.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'images/Screenshot 2025-01-19 233148.png', // Replace with your first history-related image
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Through decades of evolution, Queens has stayed true to its core values of elegance, craftsmanship, and innovation. Every piece tells a story, a journey of dedication and passion, from the very first design to the final masterpiece. The Queens legacy is not just about luxury watches—it is about preserving history, celebrating artistry, and creating timeless treasures that continue to captivate generations.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'images/logo2.png', // Replace with your second history-related image
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
