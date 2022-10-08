// import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:default_app/core/utils/app_strings.dart';
import 'package:default_app/core/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    String? cachedLanguageCode = await SharedPrefHelper.getData(key: AppStrings.localeKey);
    if (cachedLanguageCode == null) {
      print('null');
      cachedLanguageCode = 'en';
    } else {}
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await SharedPrefHelper.saveData(key: AppStrings.localeKey, value: languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
