import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blocs/cart/cart_bloc.dart';
import 'blocs/locale/locale_cubit.dart';
import 'blocs/product/product_cubit.dart';
import 'blocs/theme/theme_bloc.dart';
import 'blocs/theme/theme_state.dart';
import 'l10n/app_localizations.dart';
import 'models/product_model.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/sign_up_screen.dart';
import 'services/cache_helper.dart';
import 'services/product_service.dart';
import 'utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LazaApp());
}

class LazaApp extends StatelessWidget {
  const LazaApp({super.key});
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CartBloc()),
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (_) => LocaleCubit()),
      BlocProvider(
        create: (_) =>
            ProductCubit(ProductService(), CacheHelper())..loadProducts(),
      ),
    ],
    child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          final light = ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF9775FA),
            ),
            scaffoldBackgroundColor: const Color(0xFFF8F8FC),
            textTheme: GoogleFonts.poppinsTextTheme(),
          );
          final dark = ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF9775FA),
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Laza Shop',
            locale: locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: light,
            darkTheme: dark,
            themeMode: themeState.mode,
            initialRoute: AppRoutes.signUp,
            onGenerateRoute: (settings) {
              Widget screen;
              switch (settings.name) {
                case AppRoutes.home:
                  screen = const HomeScreen();
                case AppRoutes.details:
                  final product = settings.arguments;
                  screen = product is ProductModel
                      ? ProductDetailsScreen(product: product)
                      : const HomeScreen();
                case AppRoutes.cart:
                  screen = const CartScreen();
                default:
                  screen = const SignUpScreen();
              }
              return PageRouteBuilder<void>(
                settings: settings,
                pageBuilder: (_, animation, secondaryAnimation) => screen,
                transitionsBuilder: (_, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
                transitionDuration: const Duration(milliseconds: 350),
              );
            },
          );
        },
      ),
    ),
  );
}
