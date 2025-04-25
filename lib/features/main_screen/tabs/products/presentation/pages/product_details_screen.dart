import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/widgets/color_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../widgets/desc_read_more_text.dart';
import '../widgets/product_details_images.dart';
import '../widgets/size_widget.dart';
import '../widgets/sold_rating_increase_decrease.dart';
import '../widgets/total_price_and_add_to_cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductsDataEntity product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              ProductDetailsImages(images: widget.product.images!),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title ?? " ",
                      style: AppStyles.medium18Header,
                    ),
                  ),
                  Text(
                    "EGP ${widget.product.price}",
                    style: AppStyles.medium18Header,
                  ),
                ],
              ),
              SoldQuantityRatingIncreaseDecrease(product: widget.product),
              DescriptionReadMoreText(desc: widget.product.description ?? ''),
              SizeWidget(),
              ColorWidget(),
              SizedBox(height: 60.h),
              TotalPriceAndAddToCart(
                price: widget.product.price!,
                productCounter: productCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Text("ProductDetails", style: AppStyles.semi20Primary),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, size: 25, color: AppColors.primaryColor),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart_outlined,
          size: 25,
          color: AppColors.primaryColor,
        ),
      ),
    ],
  );
}
