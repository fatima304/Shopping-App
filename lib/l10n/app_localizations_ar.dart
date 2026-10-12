// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'متجر لازا';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get createAccount => 'إنشاء الحساب';

  @override
  String get requiredName => 'الاسم الكامل مطلوب';

  @override
  String get capitalName => 'يجب أن يبدأ الاسم بحرف إنجليزي كبير';

  @override
  String get requiredEmail => 'البريد الإلكتروني مطلوب';

  @override
  String get invalidEmail => 'أدخل بريدًا إلكترونيًا صحيحًا';

  @override
  String get requiredPassword => 'كلمة المرور مطلوبة';

  @override
  String get shortPassword => 'كلمة المرور يجب ألا تقل عن 6 أحرف';

  @override
  String get requiredConfirmation => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get accountCreated => 'تم إنشاء الحساب بنجاح';

  @override
  String get ok => 'حسنًا';

  @override
  String get home => 'اكتشف';

  @override
  String get featured => 'عروض مميزة';

  @override
  String get allProducts => 'جميع المنتجات';

  @override
  String get addToCart => 'أضف إلى السلة';

  @override
  String get addedToCart => 'تمت إضافة المنتج إلى السلة';

  @override
  String get cart => 'سلتي';

  @override
  String get emptyCart => 'سلة التسوق فارغة';

  @override
  String get cartBecameEmpty => 'أصبحت سلة التسوق فارغة';

  @override
  String get total => 'الإجمالي';

  @override
  String get remove => 'إزالة';

  @override
  String get clearCart => 'إفراغ السلة';

  @override
  String get details => 'تفاصيل المنتج';

  @override
  String get category => 'الفئة';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get networkError =>
      'تعذر تحميل المنتجات. تحقق من الاتصال وحاول مرة أخرى.';

  @override
  String get noProducts => 'لا توجد منتجات متاحة';

  @override
  String get theme => 'تغيير المظهر';

  @override
  String get language => 'تغيير اللغة';

  @override
  String get quantity => 'الكمية';

  @override
  String get continueShopping => 'متابعة التسوق';

  @override
  String get offerOne => 'اكتشف منتجك المفضل';

  @override
  String get offerTwo => 'أناقة لكل يوم';

  @override
  String get offerThree => 'تسوق اختيارات جديدة';

  @override
  String get cachedNotice => 'يتم عرض المنتجات المحفوظة';
}
