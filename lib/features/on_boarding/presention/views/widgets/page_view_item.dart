import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backGroundImage,
      required this.title,
      required this.subtitle});
  final String image, backGroundImage, subtitle;
  final Row title;
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
                  child: Text("تخط",style: TextStyle(fontSize: 20),),
                )
          ],
        ),
      )
    ]);
  }
}
