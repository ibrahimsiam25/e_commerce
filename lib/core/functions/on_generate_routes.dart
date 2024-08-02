import 'package:flutter/material.dart';
import 'package:e_commerce/features/auth/presention/views/login_view.dart';
import 'package:e_commerce/features/auth/presention/views/sign_up_view.dart';
import 'package:e_commerce/features/splash/presention/views/splash_view.dart';
import 'package:e_commerce/features/on_boarding/presention/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName :
    return MaterialPageRoute(builder: (context) => const OnBoardingView()); 
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}