import 'package:project_demo/home/cubit/CategeoryState.dart';
import 'package:project_demo/home/cubit/meal_state.dart';

class HomeState {
  CategoryState  categoryState;
  MealState  mealState;

  HomeState({required this.mealState, required this.categoryState});

  HomeState updateState({CategoryState? category, MealState? mealState}) {
    return HomeState(
      mealState: mealState ?? this.mealState,
      categoryState: category ?? this.categoryState,
    );
  }
}
