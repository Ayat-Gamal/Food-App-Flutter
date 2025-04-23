import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:project_demo/home/presentation/Home.dart';
import 'package:project_demo/home/cubit/home_cubit.dart';
import 'package:project_demo/local/database_helper.dart';
import 'package:project_demo/onboarding/OnBoarding.dart';
import 'package:project_demo/repositaory/Reposatiory.dart';
import 'package:project_demo/service/ServiceApi.dart';
import 'package:project_demo/splash/Splash.dart';
import 'package:project_demo/utils/app_route.dart';
import 'package:project_demo/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        initialRoute: AppRoute.splash_screen,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: Splash(),
      ),
    );
  }
}
