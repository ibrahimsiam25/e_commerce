import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'package:e_commerce/features/auth/presention/views/sign_up_view.dart';



class DontHaveAcount extends StatelessWidget {
  const DontHaveAcount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
          TextSpan(
            children: [
              TextSpan(
    text: 'لا تمتلك حساب؟',
    style: AppTextStyle.semiBold16.copyWith(
      color: const Color(0xFF949D9E),
    ),
              ),
              TextSpan(
    text: ' ',
    style: AppTextStyle.semiBold16.copyWith(
      color: const Color(0xFF616A6B),
    ),
              ),
              TextSpan(
                 recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
    text: 'قم بإنشاء حساب',
    style:
        AppTextStyle.semiBold16.copyWith(color: AppColor.primaryColor),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        );
  }
}
