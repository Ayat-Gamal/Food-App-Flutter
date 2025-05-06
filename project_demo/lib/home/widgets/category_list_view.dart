import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/home/cubit/Home_state.dart';
import 'package:project_demo/home/cubit/home_cubit.dart';
import '../../models/category_response.dart';
import '../cubit/category_state.dart';
import 'category_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key, required this.onCategoryTap});

  final Function(Category) onCategoryTap;

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, homeState>(
      builder: (context, state) {
        switch (state.categoryState) {
          case CategoryInitial():
            return Center(child: Text("Initial State"));
          case CategoryLoading():
            return Center(child: CircularProgressIndicator());
          case CategorySuccess():
            final list = (state.categoryState as CategorySuccess).categoryList;

            return Container(
              color: Colors.white,
              height: 150.h,

              padding: EdgeInsets.all(12.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    category: list[index],
                    onCategoryTap: (value) {
                      widget.onCategoryTap(value);
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    isSelected: selectedCategory == list[index] ,
                  );
                },
              ),
            );
          case CategoryError():
            final message = (state.categoryState as CategoryError).message;

            return Center(child: Text("Error: ${message}"));
          }
      },
    );
  }
}
