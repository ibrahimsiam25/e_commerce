import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/on_boarding/presention/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
            image: Assets.assetsImagesPageViewIcon1,
            backGroundImage: Assets.assetsImagesPageViewBackground1,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('مرحبًا بك في '),
              Text('Fruit'),
              Text('HUB'),
            ]),
            subtitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية."),
        PageViewItem(
            image: Assets.assetsImagesPageViewIcon2,
            backGroundImage: Assets.assetsImagesPageViewBackground2,
            title:  Text('ابحث وتسوق'),
            subtitle:
              " نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية")
      ],
    );
  }
}
