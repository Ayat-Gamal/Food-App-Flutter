import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, this.title, required this.onViewClick});

  final title;
  final Function onViewClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          "View All",
          style: TextStyle(
            fontSize: 16.sp,
            color: Color(MainColor),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
