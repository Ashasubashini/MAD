import 'package:flutter/material.dart';
import 'package:week2/Inner.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final double price;
  final String image;

  const ItemCard({
    super.key,
    required this.name,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Colors.black12),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Image(image: AssetImage(image)),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(title, style: const TextStyle(fontSize: 18, color: Colors.grey)),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to the InnerPage when "Discover more" is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InnerPage(
                            name: name,
                            title: title,
                            description: description,
                            price: price,
                          ),
                        ),
                      );
                    },
                    child: const Text("Discover more"),
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