class ApiEndPoint {
  static const String categories = "/categories.php";
  static const String categoryList = "/filter.php?c=";
  static const String baseURL = 'https://www.themealdb.com/api/json/v1/1';

  static String getCategoryList(String category) {
    return '$baseURL/filter.php?c=$category';
  }

  static String getMealDetails(String id) {
    return '$baseURL/lookup.php?i=$id';
  }
}
