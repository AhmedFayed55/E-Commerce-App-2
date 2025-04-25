import 'package:e_commerce_app_clean/config/routes.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.productsData});

  final List<ProductsDataEntity> productsData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5 / 3.2.h,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: productsData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo : navigate to product details screen
                    GoRouter.of(context).push(
                      AppRoutes.productDetails,
                      extra: productsData[index],
                    );
                  },
                  child: ProductItemWidget(product: productsData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
