import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  int selectedSize = -1;

  List<int> sizes = [35, 38, 39, 40];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size', style: AppStyles.medium18Header),
        SizedBox(height: 8.h),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSize = index;
                  });
                },
                child: CircleAvatar(
                  radius: 22.r,
                  backgroundColor:
                      index == selectedSize
                          ? AppColors.primaryColor
                          : Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 9.h,
                    ),
                    child: Text(
                      '${sizes[index]}',
                      style: AppStyles.regular14Text.copyWith(
                        color:
                            index == selectedSize
                                ? AppColors.whiteColor
                                : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 17.w),
            itemCount: sizes.length,
          ),
        ),
      ],
    );
  }
}
