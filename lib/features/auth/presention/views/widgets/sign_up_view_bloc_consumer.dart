import 'Sigin_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/create_user/create_user_cubit.dart';


class SignnUpViewBlocConsumer extends StatelessWidget {
  const SignnUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return const SiginUpViewBody();
      },
    );
  }
}
