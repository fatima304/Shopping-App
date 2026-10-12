# Laza Shop App — Flutter Capstone V1.0

A responsive e-commerce shopping experience inspired by the supplied Figma Community reference. Includes form validation, an animated sign-up-to-home transition, live products, offline catalog cache, shopping cart, runtime EN/AR switching, and light/dark themes.


## Architecture

- `lib/blocs/cart`: CartBloc with add/remove/clear events, quantities and derived total
- `lib/blocs/theme`: ThemeBloc for runtime dark/light mode
- `lib/blocs/product`: ProductCubit for API loading/error/cached states
- `lib/blocs/locale`: LocaleCubit for runtime language switching
- `lib/services`: Dio API and SharedPreferences JSON cache
- `lib/models`, `lib/screens`, `lib/widgets`: independent, reusable Dart files
- `lib/l10n`: English/Arabic ARB source strings


## GitHub repo
https://github.com/fatima304/Shopping-App
