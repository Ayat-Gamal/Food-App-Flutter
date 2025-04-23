import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/home/cubit/Home_state.dart';
import 'package:project_demo/home/cubit/home_cubit.dart';
import 'package:project_demo/home/cubit/meal_state.dart';
import '../../models/CategoryDetails.dart';
import '../../service/ServiceApi.dart';
import 'SpecialOfferItem.dart';

class SpecialOfferList extends StatefulWidget {
  const SpecialOfferList({super.key, required this.cat});

  final String cat;

  @override
  State<SpecialOfferList> createState() => _SpecialOfferListState();
}

class _SpecialOfferListState extends State<SpecialOfferList> {
  late Future<List<Meal>> meals;

  //   categoryService.getCategoryDetails(
  //     widget.cat,
  // );
  CategoryService categoryService = new CategoryService();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getCategoryMealsById(widget.cat);

}
  @override
  void didUpdateWidget(covariant SpecialOfferList oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("WidgetCAt ${widget.cat}");
    //meals = categoryService.getCategoryDetails(widget.cat);
    context.read<HomeCubit>().getCategoryMealsById(widget.cat);
    // context.read<HomeCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.mealState) {
          case MealInitial():
            return Center(child: CircularProgressIndicator());

          case MealLoading():
            return Center(child: CircularProgressIndicator());
          case MealSuccess():
            final list = (state.mealState as MealSuccess).mealList;
            return SizedBox(
              height: 180.h,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: list.length ?? 0,
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  return SpecialOfferItem(category: list[index]);
                },
              ),
            );
          case MealError():
            final message = (state.categoryState as MealError).message;

            return Center(child: Text("Error: ${message}"));
        }

        // if (snapshot.hasData) {
        //
        // } else if (snapshot.hasError) {
        //   return Center(child: Text("Error: ${snapshot.error}"));
        // } else {
        //   return Center(child: CircularProgressIndicator());
        // }
      },
    );
  }
}
