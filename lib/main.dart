import 'package:default_app/core/localaization/app_localization.dart';
import 'package:default_app/bussiness_logic/localization_cubit.dart/locale_cubit.dart';
import 'package:default_app/core/utils/app_strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/core/constants/app_routes.dart';
import 'app_router.dart';
import 'core/constants/observer.dart';
import 'core/utils/dio_helper.dart';
import 'core/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String intialRoute = AppRoutes.home;
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // await DioHelper.init();
  await SharedPrefHelper.init();
  // AppStrings.token = SharedPrefHelper.getData(key: AppStrings.tokenKey);
  // AppStrings.locale = SharedPrefHelper.getData(key: AppStrings.localeKey);
  // if (AppStrings.token!.isNotEmpty) {
  //   intialRoute = AppRoutes.home;
  // }
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
            initialRoute: intialRoute,
            onGenerateRoute: appRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

Locale? _localeResolutionCallback(Locale? deviceLocale, Iterable<Locale> supportedLocales) {
  for (var locale in supportedLocales) {
    if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
      return deviceLocale;
    }
  }
  return supportedLocales.first;
}
