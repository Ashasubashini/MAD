import 'package:flutter/material.dart';
import 'package:week2/Login.dart';
import 'package:week2/About.dart';
import 'package:week2/branches.dart';
import 'package:week2/watchmaking.dart';
import 'package:week2/service.dart';
import 'package:week2/history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:week2/Products.dart';
import 'package:week2/network_image_widget.dart';
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
  Future<List<Product>>? futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('images/logo2.png', height: 40),
        backgroundColor: const Color(0xFF0B6E4F),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
            ListTile(
              title: const Text('Branches'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BranchesPage()));
              },
            ),
            ListTile(
              title: const Text('Watchmaking'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WatchmakingPage()));
              },
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryPage()));
              },
            ),
            ListTile(
              title: const Text('Service'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesPage()));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: widget.toggleTheme,
                child: Row(
                  children: [
                    Text(widget.isDarkMode ? 'Toggle light mode' : 'Toggle dark mode'),
                    const SizedBox(width: 16),
                    Icon(widget.isDarkMode ? Icons.sunny : Icons.nightlight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset('images/main.png', width: double.infinity, height: 200, fit: BoxFit.cover),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No products available'));
                } else {
                  List<Product> products = snapshot.data!;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      Product product = products[index];

                      return Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: NetworkImageWidget(imageUrl: product.image, width: double.infinity, height: 150),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product.smallDescription.length > 60
                                    ? '${product.smallDescription.substring(0, 60)}...' // Shortened small_description
                                    : product.smallDescription,
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)),
                                    );
                                  },
                                  child: const Text('Discover More'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, '/buying');
                break;
              case 2:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Buying'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
