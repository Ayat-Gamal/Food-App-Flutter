import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/app_route.dart';

import '../../models/category_response.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.onCategoryTap});

  final Category category;
  final Function(Category) onCategoryTap;

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        onCategoryTap(category);
       },
      child: Container(

      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(

        shape: BoxShape.circle,
        boxShadow: [

          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              category.strCategoryThumb ?? "",
              height: 60.h,
              width: 60.w,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.error, size: 60),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            category.strCategory ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    ),);
  }
}
