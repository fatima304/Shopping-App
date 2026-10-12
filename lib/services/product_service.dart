import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductService {
  ProductService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://fakestoreapi.com',
              connectTimeout: const Duration(seconds: 12),
              receiveTimeout: const Duration(seconds: 15),
            ),
          );
  final Dio _dio;
  // API failures are converted to a typed error by ProductCubit.
  Future<List<ProductModel>> fetchProducts() async {
    final response = await _dio.get<List<dynamic>>('/products');
    final data = response.data;
    if (response.statusCode != 200 || data == null) {
      throw const FormatException('Invalid product response');
    }
    return data
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
