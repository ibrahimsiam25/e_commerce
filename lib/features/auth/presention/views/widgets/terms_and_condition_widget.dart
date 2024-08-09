import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/features/auth/presention/views/widgets/custom_check_box.dart';


class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});
  final ValueChanged <bool> onChanged ;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyle.bold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style:  AppTextStyle.semiBold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style:  AppTextStyle.semiBold13,
                ),
                TextSpan(
                  text: 'الخاصة',
                  style:  AppTextStyle.semiBold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style:  AppTextStyle.semiBold13,
                ),
                TextSpan(
                  text: 'بنا',
                  style:  AppTextStyle.semiBold13
                      .copyWith(color: AppColor.lightPrimaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}