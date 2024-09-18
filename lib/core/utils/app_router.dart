import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';


abstract class AppRouter {

  static const String kOnBoardingView = '/onBoardingView';
  static const String kSigninView = '/signinView';
  static const String kSignupView = '/signupView';
  static const String kHomeView = '/home';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kSigninView,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page not found')),
    ),
  );
}
