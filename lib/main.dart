import 'package:e_commerce/core/functions/on_generate_routes.dart';
import 'package:e_commerce/features/splash/presention/views/splash_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/shared_preferences_singleton.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo'
      ),
       localizationsDelegates: [
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
