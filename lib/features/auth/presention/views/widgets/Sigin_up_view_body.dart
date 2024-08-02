import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/constents.dart';
import 'package:e_commerce/core/widgets/custom_botton.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/have_an_account_widget.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/terms_and_condition_widget.dart';

class SiginUpViewBody extends StatelessWidget {
  const SiginUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomTextField(
                hintText: 'الاسم كامل', textInputType: TextInputType.name),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditionsWidget(),
            const SizedBox(
              height: 30,
            ),
            CustomBotton(
              onPressed: () {},
              text: 'إنشاء حساب جديد',
            ),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}