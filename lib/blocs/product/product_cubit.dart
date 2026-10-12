import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_model.dart';
import '../../services/cache_helper.dart';
import '../../services/product_service.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  const ProductLoaded(this.products, {this.fromCache = false});
  final List<ProductModel> products;
  final bool fromCache;
}

class ProductError extends ProductState {
  const ProductError();
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._service, this._cache) : super(const ProductInitial());
  final ProductService _service;
  final CacheHelper _cache;
  Future<void> loadProducts() async {
    emit(const ProductLoading());
    List<ProductModel> cached = [];
    try {
      cached = await _cache.getProducts();
      if (cached.isNotEmpty) emit(ProductLoaded(cached, fromCache: true));
    } catch (_) {
      /* Cache is optional; continue with the API. */
    }
    try {
      final products = await _service.fetchProducts();
      emit(ProductLoaded(products));
      try {
        await _cache.saveProducts(products);
      } catch (_) {
        /* Best effort cache. */
      }
    } catch (_) {
      if (cached.isEmpty) emit(const ProductError());
    }
  }
}
