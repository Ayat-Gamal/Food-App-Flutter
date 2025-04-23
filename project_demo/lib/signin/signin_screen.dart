import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/local/database_helper.dart';
import 'package:project_demo/utils/SecurePref.dart';

import '../models/User.dart';
import '../signup/widgets/CustomIconButton.dart';
import '../signup/widgets/CustomeTextEdit.dart';
import '../utils/app_route.dart';
import '../utils/colors.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  SecurePref secureStorage = SecurePref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Sign In",
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
                          "Sign up to get started",
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
                  placeholder: "123123a21",
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
                        User? existedUser = await databaseHelper.getUserByEmail(
                          emailController.text,
                        );

                        if (existedUser == null || existedUser.email == null) {
                          final snackBar = SnackBar(
                            content: Text("User Not Found"),
                            backgroundColor: Color(MainColor),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          final snackBar = SnackBar(
                            content: Text("Empty Fields"),
                            backgroundColor: Color(MainColor),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (existedUser.email == emailController.text &&
                            existedUser.password == passwordController.text) {
                          final snackBar = SnackBar(
                            content: Text("Successful login"),
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
                        } else {
                          final snackBar = SnackBar(
                            content: Text("Invalid email or password login"),
                            backgroundColor: Color(MainColor),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },

                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.signUp_screen);
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign up",
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
