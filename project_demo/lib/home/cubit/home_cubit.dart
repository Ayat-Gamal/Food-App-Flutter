import 'package:bloc/bloc.dart';
import 'package:project_demo/repositaory/Reposatiory.dart';

import 'Home_state.dart';
import 'category_state.dart';
import 'meal_state.dart';

class HomeCubit extends Cubit<homeState> {
  final Repository repo;

  HomeCubit(this.repo)
    : super(
        homeState(mealState: MealInitial(), categoryState: CategoryInitial()),
      );

  Future<void> getCategories() async {
    emit(state.updateState(category: CategoryLoading()));
    try {
      final categories = await repo.getCategories();
      emit(state.updateState(category: CategorySuccess(categories)));
    } catch (ex) {
      emit(state.updateState(category: CategoryError(ex.toString())));
    }
  }

  Future<void> getCategoryMealsById(String id) async {
    emit(state.updateState(mealState: MealLoading()));

    try {
      final meals = await repo.getCategoryDetails(id);
      emit(state.updateState(mealState: MealSuccess(meals)));
    } catch (ex) {
      emit(state.updateState(mealState: MealError(ex.toString())));
    }
  }
}
