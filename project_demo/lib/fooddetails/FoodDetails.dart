import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/fooddetails/widgets/TopPartDetailsScreen.dart';
import 'package:project_demo/local/database_helper.dart';
import 'package:project_demo/models/CartItem.dart';
import 'package:project_demo/models/MealDetails.dart';
import 'package:project_demo/utils/colors.dart';

import '../service/ServiceApi.dart';
import '../utils/app_route.dart';
import 'widgets/ToppingItemWidget.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({super.key, required this.mealId});

  final String mealId;

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var service = CategoryService();
  int quantity = 2;
  double price = 15.30;
  double totalPrice = 22.34;
  late Future<DetailedMeal?> detailedMeal = service.getMealDetailsById(
    widget.mealId,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    detailedMeal = service.getMealDetailsById(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detailedMeal,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData) {
          return Center(child: Text("No categories found"));
        } else {
          var meal = snapshot.data;
          return Scaffold(
            backgroundColor: Color(0xFFF6F6F6),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: TopPartDetailsScreen(),
                          ),
                          SizedBox(height: 10.h),

                          Center(
                            child: Hero(
                              tag: meal?.idMeal ?? "",
                              child: SizedBox(
                                width: 150.w,
                                height: 150.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    width: 100.w,
                                    height: 100.h,
                                    meal?.strMealThumb ??
                                        "assets/images/burgercat.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${meal?.strMeal}',
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  meal?.strCategory ?? "Category ",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Color(MainColor),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  color: Color(MainColor),
                                  size: 18,
                                ),
                                SizedBox(width: 5.w),
                                Text('Free delivery'),
                                SizedBox(width: 15.w),
                                Icon(
                                  Icons.timer,
                                  color: Color(MainColor),
                                  size: 18,
                                ),
                                SizedBox(width: 5.w),
                                Text('45 mins'),
                                Spacer(),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 5.w),
                                Text('4.5'),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              meal?.strInstructions ?? "Instructions",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            height: 600.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF1F1D2B),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Topping for you',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                IngredientList(
                                  ingredients: meal?.ingredients ?? [],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(color: Color(0xFF000000)),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                icon: Icon(Icons.remove, color: Colors.white),
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),

                        Expanded(
                          child: Hero(
                            tag: "addToCart",
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(MainColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () async {
                                CartItem addedCartItem = CartItem(
                                  int.parse(meal!.idMeal),
                                  meal.strMeal,
                                  meal.strMealThumb,
                                  meal.strCategory,
                                   quantity,
                                );
                                print("CartItem ${addedCartItem.name}");
                                print("CartItem ${addedCartItem.id}");
                                int checkInsert = await databaseHelper
                                    .insertCartItem(addedCartItem);
                                if (checkInsert > 0) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      "$quantity Items added to basket",
                                    ),
                                    backgroundColor: Color(MainColor),
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(snackBar);
                                }else{
                                  final snackBar = SnackBar(
                                    content: Text(
                                      "Something went aWrong",
                                    ),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(snackBar);
                                }
                              },
                              child: Text(
                                'Add $quantity to basket  \$${totalPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
