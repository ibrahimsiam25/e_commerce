import 'generated/l10n.dart';
import 'firebase_options.dart';
import 'core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/custom_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_commerce/core/services/shared_preferences_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();

  await Prefs.init();

  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
          )),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
