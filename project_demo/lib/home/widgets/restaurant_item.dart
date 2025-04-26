import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/home/widgets/restaurant_list.dart';
import 'package:project_demo/utils/colors.dart';
import '../../utils/app_route.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.category});

  final CategoryFake category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.details_screen);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120.h, // Adjust image height
                      child: Image.asset(
                        category.image ?? " ", // Replace with the correct path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, " ");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h), // Space after image

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${category.categoryName}",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFCB40)),
                        Text('4.5'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            color: Color(MainColor),
                          ),
                          SizedBox(width: 5.w),
                          Text('Free Delivery'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.timer_rounded, color: Color(MainColor)),
                          SizedBox(width: 5.w),
                          Text('30 min'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
