class CategoryDetails {
  CategoryDetails({required this.meals});

  final List<Meal> meals;

  factory CategoryDetails.fromJson(dynamic json) {
    return CategoryDetails(
      meals:
          json["meals"] == null
              ? []
              : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
    );
  }
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json["strMeal"] ?? "un known",
      strMealThumb: json["strMealThumb"] ?? "assets/images/pizza_cat.png",
      idMeal: json["idMeal"] ?? "52769",
    );
  }
}
