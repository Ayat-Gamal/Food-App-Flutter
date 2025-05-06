import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:project_demo/cart/cubit/cart_cubit.dart';
import 'package:project_demo/home/presentation/Home.dart';
import 'package:project_demo/onboarding/OnBoarding.dart';
import 'package:project_demo/signin/signin_screen.dart';
import 'package:project_demo/splash/Splash.dart';
import 'package:project_demo/utils/app_route.dart';
import 'package:project_demo/viewall/view_all_meals.dart';
import '../cart/Cart.dart';
import '../fooddetails/food_details.dart';
import '../home/cubit/home_cubit.dart';
import '../local/database_helper.dart';
import '../repositaory/Reposatiory.dart';
import '../service/service_api.dart';
import '../signup/sign_up.dart';

class RouteGenerator {
  DatabaseHelper dbHelper = DatabaseHelper();

  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoute.splash_screen:
        return MaterialPageRoute(builder: (context) => Splash());
      case AppRoute.onBoarding_screen:
        return MaterialPageRoute(builder: (context) => Onboarding());
      case AppRoute.signUp_screen:
        return MaterialPageRoute(builder: (context) => Signup());
      case AppRoute.details_screen:
        return MaterialPageRoute(
          builder:
              (context) => FoodDetails(mealId: setting.arguments.toString()),
        );
      case AppRoute.home_screen: // blockProvider(child: HomeScreen)
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) => HomeCubit(
                      Repository(CategoryService(), DatabaseHelper()),
                    ),
                child: HomeScreen(),
              ),
        );
      case AppRoute.cart_screen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) => CartCubit(
                      Repository(CategoryService(), DatabaseHelper()),
                    ),
                child: Cart(),
              ),
        );
      case AppRoute.signIn_screen:
        return MaterialPageRoute(builder: (context) => SignIn());
      case AppRoute.view_all_meals:
        return MaterialPageRoute( builder: (context) =>ViewAllMeals( category:  setting.arguments.toString()));
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
