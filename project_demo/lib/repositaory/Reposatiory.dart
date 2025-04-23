import 'package:project_demo/local/database_helper.dart';
import 'package:project_demo/service/ServiceApi.dart';

import '../models/CartItem.dart';
import '../models/CategoryDetails.dart';
import '../models/CategoryResponse.dart';
import '../models/MealDetails.dart';
import '../models/User.dart';

class Repository {
  CategoryService categoryService;
  DatabaseHelper databaseHelper;

  Repository(this.categoryService, this.databaseHelper);

  Future<int> insertUser(User user) async {
    return await databaseHelper.insertUser(user);
  }

  Future<User?> getUserByEmail(String email) async {
    return await databaseHelper.getUserByEmail(email);
  }

  Future<int> deleteUser(int id) async {
      return await databaseHelper.deleteUser(id);
  }

  Future<int> insertCartItem(CartItem cartItem) async {
    return await  databaseHelper.insertCartItem(cartItem);
  }

  Future<List<CartItem>?> getAllCartItems() async {

    return await databaseHelper.getAllCartItems();

  }

  Future<int> deleteCartItem(int id) async {
    return await databaseHelper.deleteCartItem(id);
  }


  Future<List<Category>> getCategories() async {
    return await categoryService.getCategories();
  }

  Future<List<Meal>> getCategoryDetails(String cat) async {
    return await categoryService.getCategoryDetails(cat);
  }

  Future<DetailedMeal?> getMealDetailsById(String id) async {
    return await categoryService.getMealDetailsById(id);
  }

}
