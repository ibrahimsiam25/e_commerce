import 'package:svg_flutter/svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/constants.dart';
import '../../../../../core/utils/app_router.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNaviagtion() async{
    bool isOnBoardingViewSeen =await Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
       // ignore: use_build_context_synchronously
       GoRouter.of(context).go(AppRouter.kSigninView);
      } else {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AppRouter.kOnBoardingView);
      }
    });
  }
}
