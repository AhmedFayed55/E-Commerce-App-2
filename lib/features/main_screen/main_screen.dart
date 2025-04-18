import 'package:e_commerce_app_clean/core/components/custom_text_form_field.dart';
import 'package:e_commerce_app_clean/core/utils/app_assets.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/categories/presentation/pages/categories_screen.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/favorite/presentation/pages/favorite_screen.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/pages/home_screen.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/user/presentation/pages/user_screen.dart';
import 'package:e_commerce_app_clean/features/main_screen/widgets/build_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(), CategoriesScreen(), FavoriteScreen(), UserScreen()
  ];
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(selectedIndex, context),
      body: screens[selectedIndex],
      bottomNavigationBar: BuildBottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex
      ),
    );
  }
}


PreferredSizeWidget _buildAppBar(int index, BuildContext context) {
  return AppBar(
    leadingWidth: double.infinity,
    toolbarHeight: index != 3 ? 120.h : 65.h,
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: Column(
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.routeLogoBlue),
          Visibility(
            visible: index != 3,
            child: Expanded(
                child: Row(
                  spacing: 7.w,
                  children: [
                    Expanded(child: CustomTextFormField(
                      prefixIcon: Image.asset(AppImages.searchIconMain),
                      hintText: "What do you want search for?",
                      hintStyle: AppStyles.light14SearchHint,)),
                    Badge(
                        alignment: AlignmentDirectional.topStart,
                        backgroundColor: AppColors.greenColor,
                        label: Text("5", style: TextStyle(
                            fontSize: 20.sp
                        ),),
                        child: IconButton(onPressed: () {
                          // // todo : navigate to cart screen
                          // Navigator.of(context)
                          //     .pushNamed(AppRoutes.cartScreenRoute);
                        },
                            icon: Icon(
                              Icons.shopping_cart_outlined, size: 40.sp,))
                    ),
                  ],
                )),
          )
        ],
      ),
    ),
  );
}




