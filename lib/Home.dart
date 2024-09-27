import 'package:flutter/material.dart';
import 'package:week2/Login.dart';
import 'package:week2/About.dart';
import 'package:week2/Inner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.isDarkMode, required this.toggleTheme});

  final bool isDarkMode;
  final void Function() toggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/logo2.png',
          height: 40,
        ),
        backgroundColor: const Color(0xFF0B6E4F),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.person))
        ],
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.green,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  widget.toggleTheme();
                },
                child: Row(
                  children: [
                    widget.isDarkMode ? const Text('Toggle light mode') : const Text('Toggle dark mode'),
                    const SizedBox(width: 16,),
                    widget.isDarkMode ? const Icon(Icons.sunny) : const Icon(Icons.nightlight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("images/main.png")),
            const SizedBox(height: 16),
            // Using MediaQuery to create a responsive layout
            LayoutBuilder(
              builder: (context, constraints) {
                if (MediaQuery.of(context).size.width < 600) {
                  // Mobile layout
                  return Column(
                    children: [
                      ItemCard(
                        name: "Timeless Elegance",
                        title: "A Classic Companion for Every Occasion",
                        description: "Indulge in the allure of timelessness with watches made in oystersteel, white gold, and other exquisite materials.",
                        price: 55000.00,
                        image: "images/item1Home.jpg",
                      ),
                      ItemCard(
                        name: "Golden Aurora",
                        title: "Illuminate Your Wrist with Golden Radiance",
                        description: "The Golden Aurora Watch is a luxurious timepiece crafted with rose gold and adorned with sparkling diamonds.",
                        price: 76000.00,
                        image: "images/Item2Home.jpg",
                      ),
                      ItemCard(
                        name: "Luxe Horizon",
                        title: "Radiate Glamour with Every Tick",
                        description: "The Luxe Horizon watch is a sleek timepiece featuring a glossy black finish that exudes sophistication.",
                        price: 80000.00,
                        image: "images/Item3Home.jpg",
                      ),
                      ItemCard(
                        name: "Serenity Sky",
                        title: "Embrace Tranquility in Style",
                        description: "The Serenity Sky watch is a regal timepiece designed in a royal golden hue with hints of brown.",
                        price: 66000.00,
                        image: "images/Item5Home.jpg",
                      ),
                      ItemCard(
                        name: "Midnight Majesty",
                        title: "Unveil the Majesty of Midnight",
                        description: "Midnight Majesty watch shines in a beautiful black color, displaying both date and month.",
                        price: 95000.00,
                        image: "images/Item6Home.jpg",
                      ),
                    ],
                  );
                } else {
                  // Tablet or larger layout
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ItemCard(
                          name: "Timeless Elegance",
                          title: "A Classic Companion for Every Occasion",
                          description: "Indulge in the allure of timelessness with watches made in oystersteel, white gold, and other exquisite materials.",
                          price: 55000.00,
                          image: "images/item1Home.jpg",
                        ),
                      ),
                      Expanded(
                        child: ItemCard(
                          name: "Golden Aurora",
                          title: "Illuminate Your Wrist with Golden Radiance",
                          description: "The Golden Aurora Watch is a luxurious timepiece crafted with rose gold and adorned with sparkling diamonds.",
                          price: 76000.00,
                          image: "images/Item2Home.jpg",
                        ),
                      ),
                      Expanded(
                        child: ItemCard(
                          name: "Luxe Horizon",
                          title: "Radiate Glamour with Every Tick",
                          description: "The Luxe Horizon watch is a sleek timepiece featuring a glossy black finish that exudes sophistication.",
                          price: 80000.00,
                          image: "images/Item3Home.jpg",
                        ),
                      ),
                      Expanded(
                        child: ItemCard(
                          name: "Serenity Sky",
                          title: "Embrace Tranquility in Style",
                          description: "The Serenity Sky watch is a regal timepiece designed in a royal golden hue with hints of brown.",
                          price: 66000.00,
                          image: "images/Item5Home.jpg",
                        ),
                      ),
                      Expanded(
                        child: ItemCard(
                          name: "Midnight Majesty",
                          title: "Unveil the Majesty of Midnight",
                          description: "Midnight Majesty watch shines in a beautiful black color, displaying both date and month.",
                          price: 95000.00,
                          image: "images/Item6Home.jpg",
                        ),
                      ),
                    ],
                  );
                }
              },
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
              Navigator.pushNamed(context, '/');
            }
            if (index == 1) {
              Navigator.pushNamed(context, '/buying');
            }
            if (index == 2) {
              Navigator.pushNamed(context, '/profile');
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
            label: 'Buying',
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
                Center(
                  child: SizedBox(
                    width: 150,  // Fixed width for the Discover More button
                    child: OutlinedButton(
                      onPressed: () {
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
