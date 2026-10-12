// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Laza Shop';

  @override
  String get signUp => 'Create Account';

  @override
  String get fullName => 'Full Name';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get createAccount => 'Sign Up';

  @override
  String get requiredName => 'Full name is required';

  @override
  String get capitalName => 'Name must start with a capital English letter';

  @override
  String get requiredEmail => 'Email is required';

  @override
  String get invalidEmail => 'Enter a valid email address';

  @override
  String get requiredPassword => 'Password is required';

  @override
  String get shortPassword => 'Password must have at least 6 characters';

  @override
  String get requiredConfirmation => 'Please confirm your password';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get accountCreated => 'Account created successfully';

  @override
  String get ok => 'OK';

  @override
  String get home => 'Discover';

  @override
  String get featured => 'Featured offers';

  @override
  String get allProducts => 'All products';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get addedToCart => 'Item added to cart';

  @override
  String get cart => 'My Cart';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get cartBecameEmpty => 'Your cart is now empty';

  @override
  String get total => 'Total';

  @override
  String get remove => 'Remove';

  @override
  String get clearCart => 'Clear cart';

  @override
  String get details => 'Product Details';

  @override
  String get category => 'Category';

  @override
  String get retry => 'Try again';

  @override
  String get networkError =>
      'Could not load products. Check your connection and try again.';

  @override
  String get noProducts => 'No products available';

  @override
  String get theme => 'Toggle theme';

  @override
  String get language => 'Switch language';

  @override
  String get quantity => 'Quantity';

  @override
  String get continueShopping => 'Continue shopping';

  @override
  String get offerOne => 'Find your next favorite';

  @override
  String get offerTwo => 'Style for every day';

  @override
  String get offerThree => 'Explore fresh picks';

  @override
  String get cachedNotice => 'Showing saved products';
}
