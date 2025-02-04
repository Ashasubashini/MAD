import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products'));

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');  // Log the response
    List<dynamic> body = jsonDecode(response.body);
    List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String smallDescription;
  final String largeDescription;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.smallDescription,
    required this.largeDescription,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      quantity: int.tryParse(json['quantity'].toString()) ?? 0,
      smallDescription: json['small_description'],
      largeDescription: json['large_description'],
      image: 'http://10.0.2.2:8000/storage/${json['image']}',
    );
  }
}