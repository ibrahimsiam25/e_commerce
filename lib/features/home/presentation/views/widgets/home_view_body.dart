import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/search_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/offers/offers__list.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_selling_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                OffersList(),
                SizedBox(height: 16),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
        
          BestSellingGridView(),
          
        ],
      ),
    );
  }
}
