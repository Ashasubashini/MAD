import 'package:flutter/material.dart';

class InnerPage extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final double price;

  const InnerPage({
    super.key,
    required this.name,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(

              ),
            ),
          ],
        ),
      ),
    );
  }
}
