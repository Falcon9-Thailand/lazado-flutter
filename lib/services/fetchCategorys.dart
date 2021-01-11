import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naiban/models/Category.dart';

// Fetch our Products from API
Future<List<Category>> fetchCategory() async {
  const String apiUrl =
      "https://5f93f5409ecf720016bfc190.mockapi.io/delivery/category";

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Category> products = (json.decode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
