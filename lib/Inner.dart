import 'package:flutter/material.dart';
import 'package:week2/Products.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:week2/cart.dart';
import 'package:week2/services/stripe_service.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  double totalPrice = 0.0;
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    totalPrice = widget.product.price;
  }

  void updateTotalPrice(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      totalPrice = widget.product.price * quantity;
    });
  }

  Future<void> addToCart() async {
    final token = await storage.read(key: 'token');
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to add to cart')),
      );
      return;
    }

    final url = Uri.parse('http://10.0.2.2:8000/api/cart/add');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'product_id': widget.product.id,
        'quantity': quantity,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to cart successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add to cart')),
      );
    }
  }

  Future<void> buyNow() async {
    final token = await storage.read(key: 'token');
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to buy now')),
      );
      return;
    }

    final url = Uri.parse('http://10.0.2.2:8000/api/checkout'); // Your API endpoint for checkout
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'product_id': widget.product.id,
        'quantity': quantity,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Proceeding to Checkout...')),
      );
      // Navigate to checkout page or show the payment interface as needed
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to initiate checkout')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.product.image,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 100);
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.smallDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.product.price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.product.quantity == 0
                      ? "Out of Stock"
                      : "Available: ${widget.product.quantity}",
                  style: TextStyle(
                    fontSize: 18,
                    color: widget.product.quantity == 0 ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: quantity > 1 ? () => updateTotalPrice(quantity - 1) : null,
                    ),
                    Text("$quantity", style: const TextStyle(fontSize: 20)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: widget.product.quantity > quantity
                          ? () => updateTotalPrice(quantity + 1)
                          : null,
                    ),
                  ],
                ),
                Text(
                  "Total: \$${totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: addToCart,
                  child: const Text("Add to Cart"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    StripeService.instance.makePayment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Use backgroundColor instead of primary
                  ),
                  child: const Text("Buy Now"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
