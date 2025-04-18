import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  const CategoryBrandItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Expanded(
          flex: 2,
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(backgroundImage: imageProvider, radius: 50.r);
            },
            placeholder:
                (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.redColor),
                ),
            errorWidget:
                (context, url, error) =>
                    Icon(Icons.error, color: AppColors.redColor),
            width: double.infinity,
            height: 100.h,
            fit: BoxFit.cover,
            imageUrl: 'https://picsum.photos/250/300',
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Laptop & Electronics",
            textWidthBasis: TextWidthBasis.longestLine,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
