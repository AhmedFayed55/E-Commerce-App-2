import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';

class BuildAdvertisements extends StatelessWidget {
  const BuildAdvertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ImageSlideshow(
        width: double.infinity,
        height: 200.h,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.asset(AppImages.advertise1, fit: BoxFit.cover),
          Image.asset(AppImages.advertise2, fit: BoxFit.cover),
          Image.asset(AppImages.advertise3, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
