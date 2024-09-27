import 'package:flutter/material.dart';
import 'package:week2/Buying.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentIndex = 1;

  final List<Map<String, String>> products = [
    {
      'image': 'images/item1Home.jpg',
      'name': 'Timeless Elegance',
      'price': '\$55000',
    },
    {
      'image': 'images/Item2Home.jpg',
      'name': 'Golden Aurora',
      'price': '\$76000',
    },
    {
      'image': 'images/Item3Home.jpg',
      'name': 'Luxe Horizon',
      'price': '\$80000',
    },
    {
      'image': 'images/Item5Home.jpg',
      'name': 'Serenity Sky',
      'price': '\$66000',
    },
    {
      'image': 'images/Item6Home.jpg',
      'name': 'Midnight Majesty',
      'price': '\$95000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buying"),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check the width of the screen
            if (MediaQuery.of(context).size.width < 600) {
              // Mobile layout: Use a vertical list
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return buildProductCard(products[index]);
                },
              );
            } else {
              // Tablet or larger layout: Use a grid layout
              return GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75, // Aspect ratio for the cards
                ),
                itemBuilder: (context, index) {
                  return buildProductCard(products[index]);
                },
              );
            }
          },
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

  Widget buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  product['price']!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyProductPage(
                          productName: product['name']!,
                          productPrice: product['price']!,
                        ),
                      ),
                    );
                  },
                  child: const Text('Buy Now'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40), // Full-width button
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
