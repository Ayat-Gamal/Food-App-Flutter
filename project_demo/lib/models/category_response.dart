class CategoryResponse {
  CategoryResponse({required this.categories});

  final List<Category> categories;

  factory CategoryResponse.fromJson(dynamic json) {
    return CategoryResponse(
      categories:
          json["categories"] == null
              ? []
              : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x)),
              ),
    );
  }
}

class Category {
  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json["idCategory"],
      strCategory: json["strCategory"],
      strCategoryThumb: json["strCategoryThumb"],
      strCategoryDescription: json["strCategoryDescription"],
    );
  }
}
