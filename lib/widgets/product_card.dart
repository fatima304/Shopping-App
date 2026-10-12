import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/product_model.dart';
import '../utils/formatters.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAdd,
  });
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onAdd;
  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'product-${product.id}',
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, error, stack) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 42,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    formatPrice(context, product.price),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: onAdd,
                  tooltip: AppLocalizations.of(context)!.addToCart,
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
