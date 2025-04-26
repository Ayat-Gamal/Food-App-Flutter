import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/local/database_helper.dart';
import 'package:project_demo/signup/widgets/custom_icon_button.dart';
import 'package:project_demo/signup/widgets/custom_text_edit.dart';
import 'package:project_demo/utils/colors.dart';

import '../models/User.dart';
import '../utils/SecurePref.dart';
import '../utils/app_route.dart';
import 'widgets/SocialButtons.dart' show SocialButton;

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();
  final SecurePref secureStorage = SecurePref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: 500.h,
            width: MediaQuery.of(context).size.width.w,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    "assets/images/pizzzabg.png",
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomIconButton(
                          icon: Icons.arrow_back,
                          onClick: () {
                            Navigator.pushNamed(
                              context,
                              AppRoute.onBoarding_screen,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 18.h), // Space before text
                      // "Sign Up" Title
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontFamily: "Poppins",
                        ),
                      ),

                      SizedBox(height: 5.h),

                      // Subtitle
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Please sign up to get started",
                          style: TextStyle(
                            fontSize: 18.sp,
                            letterSpacing: 1.2,
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.only(top: 250),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Custometextedit(
                  controller: nameController,
                  headline: "Full Name",
                  placeholder: "Ayat Gamal",
                  type: TextInputType.name,
                ),
                SizedBox(height: 24.h),
                Custometextedit(
                  controller: emailController,
                  headline: "E-mail",
                  placeholder: "ayat.ga113@gmail.com",
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 24.h),
                Custometextedit(
                  controller: passwordController,
                  suffixIcon: Icon(Icons.remove_red_eye),
                  headline: "Password",
                  placeholder: "************",
                  type: TextInputType.visiblePassword,
                ),

                SizedBox(height: 24.h),
                Center(
                  child: SizedBox(
                    width: 250.w,
                    height: 55.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(MainColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      onPressed: () async {
                        User user = User(
                          nameController.text,
                          passwordController.text,
                          emailController.text,
                        );

                        print("Name Coneooller ${nameController.text}");
                        print("email Coneooller ${emailController.text}");

                        int checkInset = await dbHelper.insertUser(user);
                        print("Insert + ${checkInset.toString()}");
                        if (checkInset != 0) {
                          final snackBar = SnackBar(
                            content: Text("Welcome ${user.name}"),
                            backgroundColor: Color(MainColor),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          await secureStorage.saveData(
                            "email",
                            emailController.text,
                          );
                          await secureStorage.saveData(
                            "pass",
                            passwordController.text,
                          );

                          Navigator.pushNamed(context, AppRoute.home_screen);
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "Or Sign up with",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),

                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      text: "FACEBOOK",
                      imagePath: 'assets/images/facebook.png',
                      onPressed: () {},
                    ),
                    SizedBox(width: 10.w),
                    SocialButton(
                      onPressed: () {},

                      text: "GOOGLE",
                      imagePath: 'assets/images/google.png',
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.signIn_screen);
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: Color(MainColor),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
