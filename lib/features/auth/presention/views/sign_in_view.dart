import 'package:flutter/material.dart';
import '../../domian/repos/auth_repo.dart';
import '../manger/sign_in/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import 'package:e_commerce/core/widgets/Custom_appBar.dart';
import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/sign_in_view_body.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/sign_in_view_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: 'تسجيل الدخول', context: context),
        body:const SignInViewBlocConsumer(),
      ),
    );
  }
}