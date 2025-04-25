import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import 'custom_txt.dart';

class RatingAndAddToCart extends StatelessWidget {
  const RatingAndAddToCart({super.key, required this.rating});

  final num? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTxt(text: "Review ($rating})"),
        Icon(Icons.star, color: AppColors.orangeColor, size: 25.sp),
        const Spacer(flex: 1),
        InkWell(
          onTap: () {
            //todo: Add to cart
          },
          child: Icon(
            Icons.add_circle,
            size: 32.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
