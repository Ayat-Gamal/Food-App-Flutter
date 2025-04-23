import 'package:flutter/material.dart';
import 'package:project_demo/utils/app_route.dart';
import 'package:project_demo/utils/colors.dart';

import '../utils/SecurePref.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  SecurePref securePref = SecurePref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MainColor),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset("assets/images/top_decoration.png"),
          ),

          GestureDetector(
            onTap: () async {
              String? email = await securePref.readData("email");
              String? password = await securePref.readData("pass");

              print("email in splash: $email");
              print("password in splash: $password");

              if (email != null &&
                  email.isNotEmpty &&
                  password != null &&
                  password.isNotEmpty) {
                Navigator.pushNamed(context, AppRoute.home_screen);
              } else {
                Navigator.pushNamed(context, AppRoute.onBoarding_screen);
              }
            },

            child: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/images/bottom_decoraton.png"),
          ),
        ],
      ),
    );
  }
}
