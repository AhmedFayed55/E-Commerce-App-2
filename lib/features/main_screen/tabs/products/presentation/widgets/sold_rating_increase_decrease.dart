import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../domain/entities/products_response_entity.dart';
import 'increase_or_decrease.dart';

class SoldQuantityRatingIncreaseDecrease extends StatelessWidget {
  const SoldQuantityRatingIncreaseDecrease({super.key, required this.product});

  final ProductsDataEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.w,
      children: [
        Container(
          alignment: Alignment.center,
          width: 110.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(35.r),
          ),
          child: Text(
            "${product.quantity} sold",
            style: AppStyles.medium14Category.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 12.w),
        Image.asset(AppImages.starIcon, width: 20.w),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            style: AppStyles.regular14Text,
            "${product.ratingsAverage} (${product.ratingsQuantity})",
          ),
        ),
        IncreaseOrDecrease(),
      ],
    );
  }
}
