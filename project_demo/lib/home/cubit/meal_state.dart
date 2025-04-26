
import '../../models/category_details.dart';

sealed class MealState {}

final class MealInitial extends MealState {}

final class MealLoading extends MealState {}

final class MealSuccess extends MealState {
  final List<Meal> mealList;

  MealSuccess(this.mealList);
}

final class MealError extends MealState {
  final String message;

  MealError(this.message);
}
