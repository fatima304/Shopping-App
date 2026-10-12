import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/product_model.dart';

class BannerPageView extends StatelessWidget {
  const BannerPageView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final titles = [l10n.offerOne, l10n.offerTwo, l10n.offerThree];
    final featured = products.take(3).toList();
    return SizedBox(
      height: 165,
      child: PageView.builder(
        itemCount: featured.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF9775FA), Color(0xFF6C48C5)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  titles[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Image.network(
                  featured[index].image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, error, stack) => const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
