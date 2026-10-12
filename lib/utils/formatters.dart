import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String formatPrice(BuildContext context, double price) => NumberFormat.currency(
  locale: Localizations.localeOf(context).languageCode,
  symbol: r'$',
  decimalDigits: 2,
).format(price);
