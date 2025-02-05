import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api';
  final storage = const FlutterSecureStorage();

  // Register User
  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String token = data['token'];

      // Store token securely
      await _saveToken(token);

      return data;
    } else {
      return _handleResponse(response);
    }
  }

  // Login User
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String token = data['token'];

      // ✅ Save token in storage
      await storage.write(key: 'token', value: token);

      return data;
    } else {
      return _handleResponse(response);
    }
  }

  void checkStoredToken() async {
    String? token = await storage.read(key: 'token');
    print("🔍 Stored Token: $token");
  }

  // Logout User
  Future<void> logout() async {
    final token = await _getToken();

    if (token != null) {
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        await storage.delete(key: 'token'); // Clear token on logout
      } else {
        throw Exception('Failed to logout');
      }
    } else {
      throw Exception('No token found');
    }
  }

  // Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    String? token = await _getToken();
    return token != null;
  }

  // Get authenticated data with token
  Future<Map<String, dynamic>> getUserProfile() async {
    final token = await _getToken();

    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return _handleResponse(response);
  }

  // Helper: Save token securely in storage
  Future<void> _saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  // Helper: Retrieve token from storage
  Future<String?> _getToken() async {
    return await storage.read(key: 'token');
  }

  // Helper: Handle response
  Map<String, dynamic> _handleResponse(http.Response response) {
    final data = json.decode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'An error occurred');
    }
  }
  Future<Map<String, dynamic>?> addToCart(int productId, int quantity) async {
    try {
      final token = await _getToken();

      if (token == null) {
        throw Exception('No token found');
      }

      // Prepare headers with the authorization token
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      // Send a POST request to add the product to the cart
      final response = await http.post(
        Uri.parse('$baseUrl/cart/add'), // Ensure this matches the API endpoint
        headers: headers,
        body: json.encode({
          'product_id': productId,
          'quantity': quantity,
        }),
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        Map<String, dynamic> data = json.decode(response.body);
        return data; // Return the response data
      } else {
        throw Exception('Failed to add product to cart');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  Future<String?> createCheckoutSession(int productId, int quantity) async {
    try {
      final token = await _getToken();

      if (token == null) {
        throw Exception('No token found');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/stripe/checkout'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'product_id': productId,
          'quantity': quantity,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['checkout_url'];
      } else {
        throw Exception('Failed to create checkout session');
      }
    } catch (e) {
      print('Error creating checkout session: $e');
      return null;
    }
  }
}

