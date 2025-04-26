import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../signup/widgets/custom_icon_button.dart';



class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: "addToCart",
            child: CustomIconButton(
              icon: Icons.arrow_back,
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ),

          SizedBox(width: 108.w),
          Center(
            child: Text(
              "Cart",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );
  }
}
