import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientText extends StatelessWidget {
  const GradientText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container
      (
      padding: EdgeInsets.only(top:8 ,left: 16 ),
      child: Column(
        children: [
          Text(
            'Good Afternoon!',
            style: new TextStyle(
                fontFamily: "Poppins",
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
          )
        ],
      ),
    );
  }
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffFE724D), Color(0xffFFC529)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));