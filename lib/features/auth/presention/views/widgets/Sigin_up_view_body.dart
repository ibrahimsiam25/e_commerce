import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/utils/constents.dart';
import '../../manger/create_user/create_user_cubit.dart';
import 'package:e_commerce/core/widgets/custom_botton.dart';
import 'package:e_commerce/core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/have_an_account_widget.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/terms_and_condition_widget.dart';

class SiginUpViewBody extends StatefulWidget {
  const SiginUpViewBody({super.key});

  @override
  State<SiginUpViewBody> createState() => _SiginUpViewBodyState();
}

class _SiginUpViewBodyState extends State<SiginUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
   bool isTermsAccepted =false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomPasswoerdField(
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomBotton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (isTermsAccepted) {
  context
      .read<CreateUserCubit>()
      .creatUser(email, password, name);
}else{
  customSnakBar(context,'يجب عليك الموافقة على الشروط والإحكام');
}
                  } else {
                    setState(() {
                      _autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
