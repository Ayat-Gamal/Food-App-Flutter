class DetailedMeal {
  final String idMeal;
  final String strMeal;
  final String? strMealAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final List<String> ingredients;
  final List<String> measures;
  final String strSource;

  DetailedMeal({
    required this.idMeal,
    required this.strMeal,
    this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.ingredients,
    required this.measures,
    required this.strSource,
  });

  factory DetailedMeal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'] as String?;
      String? measure = json['strMeasure$i'] as String?;

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? "");
      }
    }

    return DetailedMeal(
      idMeal: json['idMeal'] ?? "Unknown ID",
      strMeal: json['strMeal'] ?? "No Name",
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'] ?? "No Category",
      strArea: json['strArea'] ?? "Unknown",
      strInstructions: json['strInstructions'] ?? "No Instructions",
      strMealThumb: json['strMealThumb'] ?? "https://via.placeholder.com/150",
      strTags: json['strTags'] ?? "No Tags",
      strYoutube: json['strYoutube'] ?? "",
      ingredients: ingredients,
      measures: measures,
      strSource: json['strSource'] ?? "No Source",
    );
  }
}

class MealResponse {
  final List<DetailedMeal> meals;

  MealResponse({required this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    var mealsJson = json['meals'] as List;
    List<DetailedMeal> mealsList =
        mealsJson.map((mealJson) => DetailedMeal.fromJson(mealJson)).toList();

    return MealResponse(meals: mealsList);
  }
}
