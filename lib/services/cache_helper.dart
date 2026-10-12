import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

class CacheHelper {
  static const _productsKey = 'laza_cached_products_v1';
  // Store a JSON snapshot so the catalog can be shown offline on next launch.
  Future<void> saveProducts(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _productsKey,
      jsonEncode(products.map((product) => product.toJson()).toList()),
    );
  }

  Future<List<ProductModel>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_productsKey);
    if (raw == null) return [];
    try {
      return (jsonDecode(raw) as List<dynamic>)
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      await prefs.remove(_productsKey);
      return [];
    }
  }
}
