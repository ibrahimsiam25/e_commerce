import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/offers/offers_item.dart';
class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: OffersItem(),
          );
        }),
      ),
    );
  }
}