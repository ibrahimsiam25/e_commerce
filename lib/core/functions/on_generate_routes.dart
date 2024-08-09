import 'package:flutter/material.dart';
import 'package:e_commerce/features/auth/presention/views/sign_in_view.dart';
import 'package:e_commerce/features/splash/presention/views/splash_view.dart';
import 'package:e_commerce/features/auth/presention/views/create_user_view.dart';
import 'package:e_commerce/features/on_boarding/presention/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName :
    return MaterialPageRoute(builder: (context) => const OnBoardingView()); 
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}