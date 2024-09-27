import 'package:flutter/material.dart';

class BuyProductPage extends StatelessWidget {
  final String productName;
  final String productPrice;

  BuyProductPage({required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Product'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product: $productName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: $productPrice',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Text('Quantity'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter quantity',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Address'),
            TextField(
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your address',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Account Details'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your account number',
              ),
            ),
            const SizedBox(height: 24),
            // Purchase Button
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Purchase'),
              style: ElevatedButton.styleFrom(

                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
