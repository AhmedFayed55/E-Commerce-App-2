import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({super.key});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  int selectedColor = -1;

  List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: AppStyles.medium18Header),
        SizedBox(height: 8.h),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: color[index],
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color:
                          index == selectedColor
                              ? AppColors.whiteColor
                              : Colors.transparent,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 17.w),
            itemCount: color.length,
          ),
        ),
      ],
    );
  }
}
