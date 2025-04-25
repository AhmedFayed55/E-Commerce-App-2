import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/category_or_brand_response_entity.dart';
import 'category_brand_item.dart';

class CategoryOrBrandsGridView extends StatelessWidget {
  const CategoryOrBrandsGridView({super.key, required this.content});

  final List<CategoryOrBrandDataEntity> content;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: content.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.h,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return CategoryBrandItem(
            imagePath: content[index].image!,
            categoryName: content[index].name!,
          );
        },
      ),
    );
  }
}
