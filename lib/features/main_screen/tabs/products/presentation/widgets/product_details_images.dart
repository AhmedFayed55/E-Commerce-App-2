import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';

class ProductDetailsImages extends StatelessWidget {
  const ProductDetailsImages({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 5000,
      height: 190.h,

      children:
          images.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
                imageUrl: url,
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
            );
          }).toList(),
    );
  }
}
