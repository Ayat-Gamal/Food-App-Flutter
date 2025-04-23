import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'RestaurantItem.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  final List<CategoryFake> categories = const [
    CategoryFake(
     'assets/images/sushi.png',
      'Seafood maki sushi',
    ),
    CategoryFake(
      'assets/images/sushi.png',
     'Seafood maki sushi',
    ),
    CategoryFake(
      'assets/images/sushi.png',
    'Seafood maki sushi',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      width: 480.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) =>   SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return RestaurantItem(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryFake {
  final image;
  final categoryName;

  const CategoryFake(this.image, this.categoryName,);
}
