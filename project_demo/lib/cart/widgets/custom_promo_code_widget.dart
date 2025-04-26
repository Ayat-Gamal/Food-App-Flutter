import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onAddPressed;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:   TextStyle(fontSize: 14.sp, fontFamily: "Poppins"),
        filled: true,
        fillColor: Colors.grey.shade100,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade600, // Gray outline
            width: 0.5.w,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade800,
            width: 2.w,
          ),
        ),

         suffixIcon: Padding(
          padding:  EdgeInsets.all(6.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(MainColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            onPressed: onAddPressed,
            child:   Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
