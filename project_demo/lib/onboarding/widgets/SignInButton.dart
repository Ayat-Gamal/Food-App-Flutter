
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, this.label, required this.onSIgnIn});
  final label;
  final Function onSIgnIn;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: OutlinedButton(
        onPressed: () {
          onSIgnIn();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFFF242731), width: 1.5.w),
          alignment: Alignment.center,
          backgroundColor: Color(0xFFF242731),
            fixedSize:  Size(154.w, 54.h)
        ),
        child: Text(label, style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold)),
      ),
    )
    ;
  }
}
