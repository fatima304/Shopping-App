import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));
  void toggle() => emit(Locale(state.languageCode == 'en' ? 'ar' : 'en'));
}
