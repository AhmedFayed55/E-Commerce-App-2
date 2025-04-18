import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_brand_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 35,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.h,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return CategoryBrandItem();
        },
      ),
    );
  }
}
