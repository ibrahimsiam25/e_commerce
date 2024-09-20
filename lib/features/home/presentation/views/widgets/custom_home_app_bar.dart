import 'package:svg_flutter/svg.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:e_commerce/core/helper_functions/get_user.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(12),
          decoration: const ShapeDecoration(
              shape: OvalBorder(), color: AppColors.whiteColor),
          child:
              SvgPicture.asset(fit: BoxFit.fill, Assets.imagesNotifications)),
      leading: Image.asset(Assets.imagesProfile),
      title: Text("صباح الخير !..",
          style: TextStyles.regular16.copyWith(color: AppColors.greyColor)),
      subtitle: Text(getUser().name,
          style: TextStyles.bold16.copyWith(color: AppColors.blackColor)),
    );
  }
}
