import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/network/dio_hleper.dart';
import 'package:flutter_application_2/core/observer.dart';
import 'package:flutter_application_2/core/style/theme.dart';
import 'package:flutter_application_2/features/home/cubit/home_cubit.dart';
import 'package:flutter_application_2/features/home/ui/home_screen.dart';
import 'package:flutter_application_2/features/login/cubit/login_cubit.dart';
import 'package:flutter_application_2/features/login/ui/login_screen.dart';
import 'package:flutter_application_2/features/splach/ui/splach_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'asset/lang', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'EG'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: CacheHelper.getDate(key: ChachKey.isfirstopen) != 1
          ? CacheHelper.getDate(key: ChachKey.userToken) != null
              ? BlocProvider(
                  create: (context) => HomeCubit()..getHomeOfffers(),
                  child: const HomeScreen(),
                )
              : BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                )
          : const SplachScreen(),
    );
  }
}
