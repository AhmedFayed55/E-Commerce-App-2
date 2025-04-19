import 'package:e_commerce_app_clean/core/utils/app_colors.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/manager/home_tab_states.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/manager/home_tab_view_model.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/widgets/advertisements.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/widgets/view_all_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/di/di.dart';
import '../widgets/products_grid_view.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();


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
          BlocBuilder<HomeTabViewModel, HomeTabSates>(
            buildWhen: (previous, current) {
              return current is GetAllCategoriesLoadingState ||
                  current is GetAllCategoriesErrorState ||
                  current is GetAllCategoriesSuccessState;
            },
            bloc: viewModel..getAllCategories(),
            builder: (context, state) {
              if (state is GetAllCategoriesSuccessState) {
                return SliverToBoxAdapter(
                  child: ProductsGridView(content: viewModel.categories),
                );
              } else if (state is GetAllCategoriesErrorState) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.error.errorMessage)),
                );
              } else {
                return SliverToBoxAdapter(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,),);
              }
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 7.h)),
          SliverToBoxAdapter(child: ViewAllRow(text: "Brands")),
          BlocBuilder<HomeTabViewModel, HomeTabSates>(
            buildWhen: (previous, current) {
              return current is GetAllBrandsLoadingState ||
                  current is GetAllBrandsErrorState ||
                  current is GetAllBrandsSuccessState;
            },
            bloc: viewModel..getAllBrands(),
            builder: (context, state) {
              if (state is GetAllBrandsSuccessState) {
                return SliverToBoxAdapter(
                  child: ProductsGridView(content: viewModel.brands),
                );
              } else if (state is GetAllBrandsErrorState) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.error.errorMessage)),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ),
                );
              }
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 7.h)),
          // SliverToBoxAdapter(child: ProductsGridView()),
        ],
      ),
    );
  }
}
