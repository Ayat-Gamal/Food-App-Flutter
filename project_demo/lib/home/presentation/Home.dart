import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/home/cubit/home_cubit.dart';
import 'package:project_demo/utils/SecurePref.dart';
import 'package:project_demo/utils/app_route.dart';

import '../../models/category_response.dart';
 import '../../signup/widgets/custom_icon_button.dart';
import '../widgets/category_list_view.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/drop_down_delivery.dart';
import '../widgets/gradient_text.dart';
import '../widgets/restaurant_list.dart';
import '../widgets/section_header.dart';
import '../widgets/special_offer_list.dart';

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
                        icon: Icons.shopping_cart,
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
                    title: "Meals",
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
