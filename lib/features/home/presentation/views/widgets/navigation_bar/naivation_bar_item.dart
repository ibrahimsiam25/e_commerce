import 'package:flutter/material.dart';
import '../../../../domain/entites/bottem_navigation_bar_entity.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/navigation_bar/active_item.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/navigation_bar/in_active_item.dart';




class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
