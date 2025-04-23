import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_demo/models/CategoryResponse.dart';
import 'package:project_demo/models/MealDetails.dart';
import 'package:project_demo/service/api_end_point.dart';
import '../models/CategoryDetails.dart';

class CategoryService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoint.baseURL,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  )..interceptors.add(PrettyDioLogger());

  Future<List<Category>> getCategories() async {
    try {
      Response response = await _dio.get(ApiEndPoint.categories);
      if (response.statusCode == 200) {
        var catigoriesResponse = CategoryResponse.fromJson(response.data);
        return catigoriesResponse.categories ?? [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Meal>> getCategoryDetails(String cat) async {
    try {
      Response response = await _dio.get(ApiEndPoint.getCategoryList(cat));
      print("url: ${ApiEndPoint.getCategoryList(cat)}");

      if (response.statusCode == 200) {
        var mealResponse = CategoryDetails.fromJson(response.data);
        return mealResponse.meals ?? [];
      } else {
        print("No data found for category $cat");
        return [];
      }
    } catch (e) {
      print("Error fetching category details: $e");
      return [];
    }
  }

  Future<DetailedMeal?> getMealDetailsById(String id) async {
    try {
      Response response = await _dio.get(ApiEndPoint.getMealDetails(id));
      print("url: ${ApiEndPoint.getMealDetails(id)}");

      if (response.statusCode == 200) {
        var mealResponse = MealResponse.fromJson(response.data);
        return mealResponse.meals[0];
      } else {
        print("No data found for Meal $id");
      }
    } catch (e) {
      print("Error fetching Meal details: $e");
    }
  }
}
