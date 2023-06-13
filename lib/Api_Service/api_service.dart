import 'dart:convert';

import 'package:mechine_test_sample/ModelClass/Product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://fakestoreapi.com/products';
  static const String categoriesUrl =
      'https://fakestoreapi.com/products/categories';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse(categoriesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.cast<String>();
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$apiUrl/category/$category'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch products by category');
    }
  }

  Future<List<Product>> fetchLimitedProducts(int limit) async {
    final response = await http.get(Uri.parse('$apiUrl?limit=$limit'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch limited products');
    }
  }

  Future<List<Product>> fetchSortedProducts() async {
    final response = await http.get(Uri.parse('$apiUrl?sort=desc'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch sorted products');
    }
  }

  Future<Product> fetchProductDetails(int productId) async {
    final response = await http.get(Uri.parse('$apiUrl/$productId'));
    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      return Product.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch product details');
    }
  }
}
