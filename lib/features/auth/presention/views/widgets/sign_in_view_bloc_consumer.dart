import 'sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/sign_in/sign_in_cubit.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class SignInViewBlocConsumer extends StatelessWidget {
  const SignInViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
        } else if (state is SignInFailure) {
          customSnakBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading ? true : false,
          child: const SignInViewBody());
      },
    );
  }
}
