import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/servicemain.jpg', // Replace with your main services image
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Queens watches are designed and built to last',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Service and care are at the heart of everything we do. We strive to provide exceptional service with a personal touch, ensuring that your needs are met with compassion and attention to detail. Your satisfaction and well-being are our top priorities, and we are committed to going above and beyond to exceed your expectations.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'images/service.jpg', // Replace with your first service-related image
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'We provide the best possible servicing and so preserve their excellent technical performance and pristine appearance. As a result, there is no limit on how long a Rolex watch can keep working, being handed down from one generation to the next, and living several lives.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'images/service2.jpg', // Replace with your second service-related image
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
