

import 'package:e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/utils/constents.dart';
import 'package:e_commerce/features/auth/presention/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.visible,
      required this.backGroundImage,
      required this.title,
      required this.subtitle});
  final String image, backGroundImage, subtitle;
  final Widget title;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: [
            Positioned.fill(
                child: SvgPicture.asset(
              backGroundImage,
              fit: BoxFit.fill,
            )),
            Positioned(
                bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Visibility(
                visible: visible,
                child: GestureDetector(
                  onTap: () {
                  SharedPref.setBool(isOnBoardingView, true);

                    Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                  },
                  child: const Text(
                    "تخط",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 60,
      ),
      title,
      const SizedBox(
        height: 24,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.semiBold13.copyWith(
            color:const Color(0xFF4E5456)
          )
        ),
      )
    ]);
  }
}
