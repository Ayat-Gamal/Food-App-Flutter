

 import '../../models/category_response.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<Category> categoryList;

  CategorySuccess(this.categoryList);
}

final class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
