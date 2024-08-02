  import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({required String title, required BuildContext context}) {
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child:const Icon(Icons.arrow_back_ios_new)),
      centerTitle: true,
      title:Text(title,textAlign: TextAlign.center,
      style:AppTextStyle.bold19 ,),
      
    );
  }