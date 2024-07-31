import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

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
}