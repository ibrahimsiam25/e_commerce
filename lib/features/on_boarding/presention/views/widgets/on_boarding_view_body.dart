import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/constents.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../auth/presention/views/sign_in_view.dart';
import 'package:e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/features/on_boarding/presention/views/widgets/on_boarding_page_view.dart';


class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.toInt();
     setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              color:currentPage == 1?AppColor.primaryColor: AppColor.primaryColor.withOpacity(0.5),
              activeColor: AppColor.primaryColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Visibility(
          visible: currentPage == 1?true:false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomBotton(
                text: " ابدأ الان",
                onPressed: () {
                  SharedPref.setBool(kIsOnBoardingView, true);
                    Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                  
                },
              )),
        ),
           const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
