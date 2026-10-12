import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/cart_item_model.dart';
import '../utils/formatters.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.item, required this.onRemove});
  final CartItemModel item;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          SizedBox(
            width: 74,
            height: 74,
            child: Image.network(
              item.product.image,
              errorBuilder: (_, error, stack) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${formatPrice(context, item.product.price)} × ${item.quantity}',
                ),
                Text(formatPrice(context, item.subtotal)),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            tooltip: AppLocalizations.of(context)!.remove,
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    ),
  );
}
