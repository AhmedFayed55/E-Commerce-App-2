import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_clean/core/utils/app_assets.dart';
import 'package:e_commerce_app_clean/core/utils/app_colors.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/widgets/advertisements.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/widgets/view_all_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/products_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w, left: 15.w, bottom: 15.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BuildAdvertisements()),
          SliverToBoxAdapter(child: SizedBox(height: 7.h)),
          SliverToBoxAdapter(child: ViewAllRow(text: "Categories")),
          SliverToBoxAdapter(child: SizedBox(height: 7.h)),
          SliverToBoxAdapter(child: ProductsGridView()),
          SliverToBoxAdapter(child: SizedBox(height: 7.h)),
          SliverToBoxAdapter(child: ViewAllRow(text: "Brands")),
          SliverToBoxAdapter(child: SizedBox(height: 7.h)),
          SliverToBoxAdapter(child: ProductsGridView()),
        ],
      ),
    );
  }
}
