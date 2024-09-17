import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/signin/signin_view_body_bloc_consumer.dart';
import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';


class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
