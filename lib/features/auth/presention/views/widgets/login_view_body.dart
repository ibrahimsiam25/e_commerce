import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/constents.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/or_divider.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/dont_have_acount.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/soical_login_button.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xFFC9CECf),
                ),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword),
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
            CustomBotton(text: 'تسجيل دخول', onPressed: () {}),
            const SizedBox(
              height: 30,
            ),
        const    DontHaveAcount(),
        const SizedBox(
          height: 20,
        ),
       const OrDivider(),
       const SizedBox(
         height: 20,
       ),
        SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesGoogleIcon,
                
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesApplIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
          ],
        ),
      ),
    );
  }
}
