import 'package:flutter/material.dart';
import 'package:week2/Login.dart';
import 'package:week2/card.dart';
import 'package:week2/About.dart';
import 'package:week2/Inner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required void Function() toggleTheme, required bool isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/logo2.png', // Replace with your actual logo image
          height: 40,
        ),
        backgroundColor: const Color(0xFF0B6E4F),
        actions: [IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }, icon: const Icon(Icons.person))],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Branches'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Watchmaking'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Service'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("images/main.png")),
            SizedBox(height: 16,),
            // Product 1: Timeless Elegance
            ItemCard(
              name: "Timeless Elegance",
              title: "A Classic Companion for Every Occasion",
              description: "Indulge in the allure of timelessness with watches made in oystersteel, white gold and other exqusite materials.",
              price: 55000.00,
              image: "images/item1Home.jpg",
            ),
            ItemCard(
              name: "Golden Aurora",
              title: "Illuminate Your Wrist with Golden Radiance",
              description: "The Golden Aurora Watch is a luxurious timepiece crafted with rose gold and adorned with sparkling diamonds. Its exquisite design exudes elegance and sophistication, making it a stunning accessory for any occasion. With its precision movement and intricate detailing, this watch not only keeps time impeccably but also adds a touch of opulence to your style.",
              price: 76000.00,
              image: "images/Item2Home.jpg",
            ),
            // Product 2: Luxe Horizon
            ItemCard(
              name: "Luxe Horizon",
              title: "Radiate Glamour with Every Tick",
              description: "The Luxe Horizon watch is a sleek timepiece featuring a glossy black finish that exudes sophistication. Enhanced with innovative features like a dual-time zone display and a scratch-resistant sapphire crystal, this watch seamlessly blends style and functionality. Elevate your look with this modern accessory that combines elegance with practicality.",
              price: 80000.00,
              image: "images/Item3Home.jpg",
            ),
            // Product 3: Serenity Sky
            ItemCard(
              name: "Serenity Sky",
              title: "Embrace Tranquility in Style",
              description: "The Serenity Sky watch is a regal timepiece designed in a royal golden hue with hints of brown, exuding a sense of opulence and warmth. This luxurious watch boasts unique features like a moon phase complication and a genuine leather strap, combining timeless elegance with modern functionality for a truly exquisite accessory..",
              price: 66000.00,
              image: "images/Item5Home.jpg",
            ),
            ItemCard(
              name: "Midnight Majesty",
              title: "Unveil the Majesty of Midnight",
              description: "Midnight Majesty watch shines in a beautiful black color, displaying both date and month. Enhance it with extra features like a chronograph function for precise timekeeping and a moon phase complication for a touch of celestial elegance. This timepiece will truly captivate with its blend of style and sophistication..",
              price: 95000.00,
              image: "images/Item6Home.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
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
