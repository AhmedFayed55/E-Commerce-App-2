import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class TotalPriceAndAddToCart extends StatelessWidget {
  const TotalPriceAndAddToCart({
    super.key,
    required this.price,
    required this.productCounter,
  });

  final num price;
  final int productCounter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style: AppStyles.medium18Header.copyWith(
                color: AppColors.blackColor,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "EGP ${price * productCounter}",
              style: AppStyles.medium18Header.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 33.w),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.r),
              ),
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, color: AppColors.whiteColor),
                SizedBox(width: 15.w),
                AutoSizeText("Add To Cart ", style: AppStyles.medium18White),
                SizedBox(width: 27.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
