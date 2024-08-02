import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/Custom_appBar.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'تسجيل الدخول', context: context),
      body:const LoginViewBody(),
    );
  }


}