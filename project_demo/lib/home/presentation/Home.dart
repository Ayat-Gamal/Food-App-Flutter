import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/home/cubit/home_cubit.dart';
import 'package:project_demo/home/widgets/CategroyListView.dart';
import 'package:project_demo/home/widgets/CustomeSearchBar.dart';
import 'package:project_demo/home/widgets/DropDownDelivery.dart';
import 'package:project_demo/home/widgets/GradientText.dart';
import 'package:project_demo/home/widgets/RestaurantList.dart';
import 'package:project_demo/home/widgets/SectionHeader.dart';
import 'package:project_demo/home/widgets/SpecialOfferList.dart';
import 'package:project_demo/utils/SecurePref.dart';
import 'package:project_demo/utils/app_route.dart';
import '../../models/CategoryResponse.dart';
import '../../signup/widgets/CustomIconButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? category;
  SecurePref securePref = SecurePref();
@override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCategories();
  }
  @override
  Widget build(BuildContext context) {
    print("Name ${category?.strCategory}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        icon: Icons.menu,
                        onClick: () {
                          Navigator.pushNamed(context, AppRoute.cart_screen);
                        },
                      ),
                      DropDownDeliveryList(),
                      CustomIconButton(
                        onClick: () {
                          securePref.deleteData("email");
                          securePref.deleteData("pass");
                          Navigator.pushNamed(context, AppRoute.signIn_screen);
                        },
                        icon: Icons.person_outline,
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  GradientText(),

                  SizedBox(height: 15.h),

                  CustomSearchBar(),

                  SizedBox(height: 20.h),

                  CategoryListView(
                    onCategoryTap: (value) {
                      print("VALue  ${value.strCategory}");
                      setState(() {
                        category = value;
                      });
                    },
                  ),

                  SizedBox(height: 25.h),

                  SectionHeader(
                    title: "Special Offers",
                    onViewClick: () {
                      Navigator.pushNamed(context, " ");
                    },
                  ),
                  SpecialOfferList(cat: category?.strCategory ?? "Beef"),

                  SizedBox(height: 25.h),

                  SectionHeader(
                    title: "Restaurants",
                    onViewClick: () {
                      // Navigate to the Restaurants screen (to be implemented)
                    },
                  ),
                  RestaurantList(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
