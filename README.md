# Laza Shop App — Flutter Capstone V1.0

A responsive e-commerce shopping experience inspired by the supplied Figma Community reference. Includes form validation, an animated sign-up-to-home transition, live products, offline catalog cache, shopping cart, runtime EN/AR switching, and light/dark themes.

## Requirements

- Flutter SDK (Dart >= 3.4)
- Android Studio / VS Code, emulator or device
- Internet connection for the initial product request and remote product images

## Setup

```bash
flutter create --platforms=android,ios,web .
flutter pub get
flutter gen-l10n
flutter run
```

> This ZIP contains application source and configuration. Flutter-generated platform folders are intentionally not included; `flutter create .` generates them for your local SDK version. For Android only, use `flutter create --platforms=android .`.

## Architecture

- `lib/blocs/cart`: CartBloc with add/remove/clear events, quantities and derived total
- `lib/blocs/theme`: ThemeBloc for runtime dark/light mode
- `lib/blocs/product`: ProductCubit for API loading/error/cached states
- `lib/blocs/locale`: LocaleCubit for runtime language switching
- `lib/services`: Dio API and SharedPreferences JSON cache
- `lib/models`, `lib/screens`, `lib/widgets`: independent, reusable Dart files
- `lib/l10n`: English/Arabic ARB source strings

## Testing and QA

1. Submit an empty sign-up form and check all inline errors.
2. Try lowercase first name, invalid email, short password, and mismatched confirmation.
3. Submit valid values, dismiss the dialog, and verify the fade transition.
4. Verify product loading, grid, banner, details, and image failure placeholders.
5. Add the same product twice; check cart quantity, total, removal and clear-cart snackbar.
6. Switch EN/AR and verify RTL. Switch light/dark on sign-up and home.
7. Restart after a successful product fetch, then test with network disabled to confirm cached catalog.
8. Check narrow and wide emulator layouts and run `flutter analyze` and `dart format .`.

## Important limitations

- **Sign-up is validation-only**, as specified by the functional acceptance steps. No authentication backend or persisted user account is included. A production authentication system requires an explicit provider and backend credentials.
- Cart and theme state are in-memory for the session. Product catalog is cached across restarts.
- API product title/description/category originate from Fake Store API in English; app-controlled UI strings are fully localized.
- The public Figma design was supplied as a visual reference; pixel-perfect parity has not been verified.
- No emulator was available in the generation environment, so real-device screenshots, execution, and static analysis are still required.
- GitHub repository publishing must be done from your account.

## GitHub upload

```bash
git init
git add .
git commit -m "Initial Laza Shop Flutter capstone"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/laza_shop_app.git
git push -u origin main
```

## Required screenshots

Capture these on your emulator after running: sign-up errors, home products, product details, populated cart with total, Arabic UI, and dark UI.

API: https://fakestoreapi.com/products
