import 'package:flutter/material.dart';
import 'widgets/Sigin_up_view_body.dart';
import 'package:e_commerce/core/widgets/Custom_appBar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
static const String routeName = '/SignUpView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(title: 'انشاء حساب', context: context),
      body:const SiginUpViewBody(),
    );
  }
}
