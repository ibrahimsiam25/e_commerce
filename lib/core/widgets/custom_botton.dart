import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            backgroundColor: AppColor.primaryColor),
          onPressed: onPressed,
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20 ),)),
    );
  }
}
