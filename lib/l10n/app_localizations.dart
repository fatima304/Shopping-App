import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Laza Shop'**
  String get appTitle;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signUp;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get createAccount;

  /// No description provided for @requiredName.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get requiredName;

  /// No description provided for @capitalName.
  ///
  /// In en, this message translates to:
  /// **'Name must start with a capital English letter'**
  String get capitalName;

  /// No description provided for @requiredEmail.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get requiredEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @requiredPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get requiredPassword;

  /// No description provided for @shortPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must have at least 6 characters'**
  String get shortPassword;

  /// No description provided for @requiredConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get requiredConfirmation;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get home;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured offers'**
  String get featured;

  /// No description provided for @allProducts.
  ///
  /// In en, this message translates to:
  /// **'All products'**
  String get allProducts;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'Item added to cart'**
  String get addedToCart;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get cart;

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCart;

  /// No description provided for @cartBecameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is now empty'**
  String get cartBecameEmpty;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @clearCart.
  ///
  /// In en, this message translates to:
  /// **'Clear cart'**
  String get clearCart;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get details;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Could not load products. Check your connection and try again.'**
  String get networkError;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products available'**
  String get noProducts;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Switch language'**
  String get language;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get continueShopping;

  /// No description provided for @offerOne.
  ///
  /// In en, this message translates to:
  /// **'Find your next favorite'**
  String get offerOne;

  /// No description provided for @offerTwo.
  ///
  /// In en, this message translates to:
  /// **'Style for every day'**
  String get offerTwo;

  /// No description provided for @offerThree.
  ///
  /// In en, this message translates to:
  /// **'Explore fresh picks'**
  String get offerThree;

  /// No description provided for @cachedNotice.
  ///
  /// In en, this message translates to:
  /// **'Showing saved products'**
  String get cachedNotice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
