import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/widgets/product_price_and_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../domain/entities/products_response_entity.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});

  final ProductsDataEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary300Opacity, width: 2),
      ),
      child: Column(
        spacing: 1.h,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 190.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? '',
                  placeholder:
                      (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      ),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.error, color: AppColors.redColor),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  radius: 17.r,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        //todo: Add to favorite
                      },
                      color: AppColors.primaryColor,
                      padding: EdgeInsets.zero,
                      iconSize: 30.r,
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ProductPriceAndRating(product: product),
        ],
      ),
    );
  }
}
