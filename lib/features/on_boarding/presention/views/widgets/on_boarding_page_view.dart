import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/on_boarding/presention/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
final PageController pageController ;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children:  [
        PageViewItem(
          visible: true,
            image: Assets.assetsImagesPageViewIcon1,
            backGroundImage: Assets.assetsImagesPageViewBackground1,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
             const Text('مرحبًا بك في ',style: AppTextStyle.bold23,),
              Text('HUB',style: AppTextStyle.bold23.copyWith(color: AppColor.secondaryColor),),
              Text('Fruit',style: AppTextStyle.bold23.copyWith(color: AppColor.primaryColor),),
              
            ]),
            subtitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية."),
        PageViewItem(
          visible: false,
            image: Assets.assetsImagesPageViewIcon2,
            backGroundImage: Assets.assetsImagesPageViewBackground2,
            title:  Text('ابحث وتسوق'),
            subtitle:
              " نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية")
      ],
    );
  }
}
