import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/app_route.dart';
import 'package:project_demo/utils/colors.dart';

import '../../models/category_response.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem(
      {super.key, required this.category, required this.onCategoryTap, this.isSelected = false});

  final Category category;
  final Function(Category) onCategoryTap;
  final bool isSelected;

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onCategoryTap(widget.category);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (widget.isSelected)
              Positioned(
                top: 3,
                child: Container(
                  height: 120.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(SecondaryColor),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    widget.category.strCategoryThumb ?? "",
                    height: 60.h,
                    width: 60.w,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, size: 60),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.category.strCategory ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
