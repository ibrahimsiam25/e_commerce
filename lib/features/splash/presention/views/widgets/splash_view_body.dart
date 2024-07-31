import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/on_boarding/presention/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsImagesSplashTop),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesIcon),
        SvgPicture.asset(Assets.assetsImagesSplashBottom,
        fit: BoxFit.fill,
        ),
      ],
    );
  }
  void excuteNavigation(){
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}