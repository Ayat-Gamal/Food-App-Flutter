import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/app_route.dart';

import '../../models/category_details.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.category});

  final Meal category;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height.h,
      // width: MediaQuery.of(context).size.width.w,
      height: 130.h,
      width: 330.w,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFF6B57),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.details_screen,
                arguments: category.idMeal,
              );
            },
            child: Hero(
              tag: category.idMeal ?? "",
              child: SizedBox(
                width: 150.w,
                height: 150.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    "${category.strMealThumb}",
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text(
                      "4.5",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),

                Text(
                  "${category.strMeal}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    Icon(
                      Icons.local_shipping,
                      color: Colors.white70,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Free delivery",
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoute.details_screen,
                          arguments: category.idMeal,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE54630),
                        foregroundColor: Color(0xFFFFFFFF),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Text("Buy Now"),
                    ),
                    //the fixed size
                    // Text(
                    //   "\$22.00",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 12.sp,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
