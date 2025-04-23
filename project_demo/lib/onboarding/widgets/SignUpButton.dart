import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, this.label, required this.onSIgnUp});

  final label;
  final Function onSIgnUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        onPressed: () {
          onSIgnUp();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFFFFFFFF), width: 1.5.w),
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          fixedSize: Size(154.w, 54.h),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
