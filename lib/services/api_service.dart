import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/api'; // Replace with your API's base URL

  // Fetch all categories
  Future<List<dynamic>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Fetch products in a category
  Future<List<dynamic>> getProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/products?category=$categoryId'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}

