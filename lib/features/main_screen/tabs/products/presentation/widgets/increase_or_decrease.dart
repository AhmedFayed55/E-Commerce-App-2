import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class IncreaseOrDecrease extends StatefulWidget {
  IncreaseOrDecrease({super.key});

  @override
  State<IncreaseOrDecrease> createState() => _IncreaseOrDecreaseState();
}

class _IncreaseOrDecreaseState extends State<IncreaseOrDecrease> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (counter > 0) {
                  counter--;
                }
              });
            },
            child: Icon(
              Icons.remove_circle_outline,
              size: 30.sp,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 18.w),
          AutoSizeText("$counter", style: AppStyles.medium18White),
          SizedBox(width: 18.w),
          InkWell(
            onTap: () {
              counter++;
              setState(() {});
            },
            child: Icon(
              Icons.add_circle_outline,
              size: 30.sp,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
