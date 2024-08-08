import 'package:flutter/material.dart';
import '../../domian/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/widgets/Custom_appBar.dart';
import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:e_commerce/features/auth/presention/manger/create_user/create_user_cubit.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/sign_up_view_bloc_consumer.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/SignUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: customAppBar(title: 'انشاء حساب', context: context),
        body:const SignnUpViewBlocConsumer(),
      ),
    );
  }
}

