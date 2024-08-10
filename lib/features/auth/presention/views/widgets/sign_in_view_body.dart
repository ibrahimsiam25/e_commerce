import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/sign_in/sign_in_cubit.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/constents.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/or_divider.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/dont_have_acount.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/soical_sign_in_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomPasswoerdField(onSaved: (value) {
                password = value!;
              }),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: AppTextStyle.bold13
                        .copyWith(color: AppColor.lightPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomBotton(
                  text: 'تسجيل دخول',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignInCubit>().signIn(email, password);
                    } else {
                      _autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              const DontHaveAcount(),
              const SizedBox(
                height: 20,
              ),
              const OrDivider(),
              const SizedBox(
                height: 20,
              ),
              SocialSignInButton(
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialSignInButton(
                onPressed: () {},
                image: Assets.assetsImagesApplIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialSignInButton(
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
