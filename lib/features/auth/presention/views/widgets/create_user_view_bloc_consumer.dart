import 'create_user_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/create_user/create_user_cubit.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateUserViewBlocConsumer extends StatelessWidget {
  const CreateUserViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
      if(state is CreateUserSuccess){
       
      } if(state is CreateUserFailure){
        customSnakBar(context, state.errorMessage);
      }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is CreateUserLoading?true:false,
          child: const CreateUserViewBody(),
        );
      },
    );
  }


}
