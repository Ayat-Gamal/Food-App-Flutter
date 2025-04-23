import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientList extends StatelessWidget {
  final List<String> ingredients;

  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height.h / 1.8,

      padding: EdgeInsets.all(12.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return toppingItem(
            ingredients[index],
            index == 0, // First item selected by default
            getImageForIngredient(ingredients[index]),
          );
        },
      ),
    );
  }

  String getImageForIngredient(String ingredient) {
    return "https://www.themealdb.com/images/ingredients/$ingredient.png";
  }
}

Widget toppingItem(String name, bool selected, String imagePath) {
  return Container(
    width: 550.w,
    height: 100.h,
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(15.0.r),
      color: Colors.black,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          imagePath,
          width: 50.w,
          height: 50.h,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 50, color: Colors.red);
          },
        ),
        SizedBox(height: 5.h, width: 8.w),
        Text(
          overflow: TextOverflow.fade,
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
        Spacer(),
        Icon(
          selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: selected ? Colors.redAccent : Colors.grey,
        ),
      ],
    ),
  );
}
