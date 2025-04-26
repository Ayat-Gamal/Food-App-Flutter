import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: SearchBar(
        elevation: MaterialStateProperty.all<double>(10.0),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(GraySecnod),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        hintStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(color: Colors.black26, fontSize: 16.0.sp),
        ),
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
        ),
        leading: Icon(Icons.search, color: Colors.grey, size: 20),
        hintText: "Search dishes, restaurants",
      ),
    );
  }
}
