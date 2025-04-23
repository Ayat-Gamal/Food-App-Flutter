import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/onboarding/widgets/SignUpButton.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/onboarding/widgets/SignInButton.dart';

import '../utils/app_route.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(SecondaryColor),
      body: Stack(
        children: [
          Container(
            child: Image.asset("assets/images/onscreen_decoration.png"),
          ),

          Positioned.fill(
            child: Image.asset(
              "assets/images/dount.png",

              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 320.w,
                  child: Text(
                    "Donut worry, be happy and eat more donuts!",
                    textAlign: TextAlign.left,

                    style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.white,
                      fontSize: 36.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SignUpButton(label: "Sign Up", onSIgnUp: () => {

                      Navigator.pushNamed(context, AppRoute.signUp_screen)

                    }),
                      SizedBox(width: 20.w),
                    SignInButton(label: "Log in", onSIgnIn: ()=>{
                      Navigator.pushNamed(context, AppRoute.signIn_screen)

                    },),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
