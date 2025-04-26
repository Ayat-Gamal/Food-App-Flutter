import 'package:project_demo/home/cubit/meal_state.dart';

import 'category_state.dart';

class homeState {
  CategoryState  categoryState;
  MealState  mealState;

  homeState({required this.mealState, required this.categoryState});

  homeState updateState({CategoryState? category, MealState? mealState}) {
    return homeState(
      mealState: mealState ?? this.mealState,
      categoryState: category ?? this.categoryState,
    );
  }
}
