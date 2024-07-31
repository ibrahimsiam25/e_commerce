import 'package:e_commerce/features/on_boarding/presention/views/on_boarding_view.dart';
import 'package:e_commerce/features/splash/presention/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName :
    return MaterialPageRoute(builder: (context) => const OnBoardingView()); 
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}