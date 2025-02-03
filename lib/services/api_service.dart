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

    return _handleResponse(response);
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
      // Save token in secure storage
      final data = json.decode(response.body);
      await storage.write(key: 'token', value: data['token']);
      return data;
    } else {
      return _handleResponse(response);
    }
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

  // Get authenticated data with token
  Future<Map<String, dynamic>> getUserProfile() async {
    final token = await _getToken();

    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user'), // Use the correct endpoint for user profile
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return _handleResponse(response);
  }

  // Generate API Token (optional use case for user-generated tokens)
  Future<Map<String, dynamic>> generateApiToken(String name, List<String> permissions) async {
    final token = await _getToken();

    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.post(
      Uri.parse('$baseUrl/api-tokens'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'name': name,
        'permissions': permissions,
      }),
    );

    return _handleResponse(response);
  }

  // Helper: Get token from secure storage
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
}
