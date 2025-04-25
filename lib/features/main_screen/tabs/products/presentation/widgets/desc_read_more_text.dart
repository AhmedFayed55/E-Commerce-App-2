import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class DescriptionReadMoreText extends StatelessWidget {
  const DescriptionReadMoreText({super.key, required this.desc});

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: AppStyles.medium18Header),
        ReadMoreText(
          desc,
          style: AppStyles.light18HintText,
          trimExpandedText: "Read Less",
          trimCollapsedText: "Read More",
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: AppColors.primaryColor,
        ),
      ],
    );
  }
}
