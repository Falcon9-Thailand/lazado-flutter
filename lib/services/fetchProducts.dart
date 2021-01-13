import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naiban/models/Products.dart';

// Fetch our Products from API
Future<List<Product>> fetchProducts() async {
  const String apiUrl =
      "https://5f93f5409ecf720016bfc190.mockapi.io/delivery/product";

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    // หากเซิร์ฟเวอร์ส่งค่าคืนสถานะ 200 OK ,
    // ทำ json.decode(utf8.decode(response.bodyBytes)
    List<Product> products =
        (json.decode(utf8.decode(response.bodyBytes)) as List)
            .map((data) => Product.fromJson(data))
            .toList();
    // Return เป็น list products
    return products;
  } else {
    // หากเซิร์ฟเวอร์ไม่ส่งค่าคืนสถานะ !200 OK
    throw Exception('Failed to load');
  }
}
