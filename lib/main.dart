import 'package:flutter/material.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/custom_bloc_observer.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_commerce/core/functions/on_generate_routes.dart';
import 'package:e_commerce/features/splash/presention/views/splash_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
  await SharedPref.init();
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
