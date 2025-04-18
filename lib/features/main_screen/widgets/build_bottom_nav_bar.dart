import 'package:e_commerce_app_clean/core/utils/app_assets.dart';
import 'package:e_commerce_app_clean/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  BuildBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  int selectedIndex;
  Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.r),
        topRight: Radius.circular(25.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: selectedIndex,
          items: [
            buildBottomNavigationBarItem(
              selectedImage: AppImages.homeIconSelected,
              unSelectedImage: AppImages.homeIconUnSelected,
              isSelected: selectedIndex == 0,
            ),
            buildBottomNavigationBarItem(
              selectedImage: AppImages.categoriesIconSelected,
              unSelectedImage: AppImages.categoriesIconUnSelected,
              isSelected: selectedIndex == 1,
            ),
            buildBottomNavigationBarItem(
              selectedImage: AppImages.favoriteIconSelected,
              unSelectedImage: AppImages.favoriteIconUnSelected,
              isSelected: selectedIndex == 2,
            ),
            buildBottomNavigationBarItem(
              selectedImage: AppImages.profileIconSelected,
              unSelectedImage: AppImages.profileIconUnSelected,
              isSelected: selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem({
  required String selectedImage,
  required String unSelectedImage,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    label: "",
    icon: CircleAvatar(
      backgroundColor:
          isSelected ? AppColors.whiteColor : AppColors.transparent,
      radius: 25.r,
      child: Image.asset(isSelected ? selectedImage : unSelectedImage),
    ),
  );
}
