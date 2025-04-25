import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/widgets/rating_and_add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../domain/entities/products_response_entity.dart';
import 'custom_txt.dart';

class ProductPriceAndRating extends StatelessWidget {
  const ProductPriceAndRating({super.key, required this.product});

  final ProductsDataEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Column(
        spacing: 2.h,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTxt(text: product.title ?? ''),
          Row(
            spacing: 16.w,
            children: [
              CustomTxt(text: "EGP ${product.price}"),
              CustomTxt(
                text: "EGP ${product.price! * 1.5.floor()}",
                textStyle: AppStyles.regular12SalePrice.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          RatingAndAddToCart(rating: product.ratingsAverage),
        ],
      ),
    );
  }
}
