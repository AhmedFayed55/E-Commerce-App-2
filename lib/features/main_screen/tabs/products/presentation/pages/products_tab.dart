import 'package:e_commerce_app_clean/core/components/custom_elevated_button.dart';
import 'package:e_commerce_app_clean/core/utils/app_colors.dart';
import 'package:e_commerce_app_clean/core/utils/app_styles.dart';
import 'package:e_commerce_app_clean/core/utils/strings.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/manager/product_tab_states.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/manager/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/di/di.dart';
import '../widgets/products_grid_view.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
              bloc: viewModel..getAllProducts(),
              builder: (context, state) {
                if (state is ProductTabErrorState) {
                  return Center(
                    child: Column(
                      spacing: 10.h,
                      children: [
                        Text(
                          AppStrings.someThing,
                          style: AppStyles.medium20Primary,
                        ),
                        CustomElevatedButton(
                          text: "Try Again",
                          onTap: () {
                            viewModel.getAllProducts();
                          },
                        ),
                      ],
                    ),
                  );
                } else if (state is ProductTabSuccessState) {
                  return ProductsGridView(productsData: viewModel.productsData);
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
