import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:week2/network_image_widget.dart';

const String baseUrl = 'http://10.0.2.2:8000/api/cart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final storage = FlutterSecureStorage();
  List<dynamic> cartItems = [];
  bool isLoading = true;
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    token = await storage.read(key: 'token');
    if (token == null) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to view your cart')),
      );
      return;
    }
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl'),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');  // <-- Debugging line

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          cartItems = data['cart_items'] ?? [];
          isLoading = false;
        });
      } else {
        print('Error: ${response.reasonPhrase}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Exception: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          var item = cartItems[index];
          var product = item['product'] ?? {};
          var imageUrl = 'http://10.0.2.2:8000/storage/' + (product['image'] ?? ''); // Add the full URL to image

          return Card(
            elevation: 5,  // Add shadow to make the card pop
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the card
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  NetworkImageWidget(imageUrl: imageUrl),  // Custom image widget
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'] ?? 'Unknown Product',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['small_description'] ?? '',
                          style: TextStyle(color: Colors.grey[600]),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Quantity: ${item['quantity'] ?? 1}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 28,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
