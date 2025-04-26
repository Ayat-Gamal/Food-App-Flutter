import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/colors.dart';

class Custometextedit extends StatelessWidget {
  const Custometextedit({
    super.key,
    this.headline,
    this.placeholder,
    this.type,
    this.suffixIcon, required this.controller,
  });

  final headline;
  final placeholder, type, suffixIcon;
  final TextEditingController  controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(headline, style: TextStyle(fontSize: 16.sp)),
          SizedBox(height: 10.h),
          Container(
            color: Color(Gray),
            child: TextField(
              controller: controller,
              keyboardType: type,
              obscureText: type == TextInputType.visiblePassword,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                hintText: placeholder,
                labelText: headline,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
