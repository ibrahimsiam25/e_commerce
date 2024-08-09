import 'package:flutter/material.dart';
import '../../domian/repos/auth_repo.dart';
import '../manger/sign_in/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/Custom_appBar.dart';
import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: 'تسجيل الدخول', context: context),
        body: const LoginViewBody(),
      ),
    );
  }
}
