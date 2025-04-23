import 'package:path/path.dart';
import 'package:project_demo/models/CartItem.dart';
import 'package:sqflite/sqflite.dart';

import '../models/User.dart';

class DatabaseHelper {
  static Database? _instance;
  static String usersTable = "users";
  static String cartItemTable = "cartItems";

  Future<Database> get database async {
    if (_instance != null) return _instance!;
    _instance = await _initDatabase();
    return _instance!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT) ",
        );

        await db.execute(
          "CREATE TABLE cartItems(id INTEGER PRIMARY KEY, name TEXT, image TEXT, category TEXT, quantity INTEGER) ",
        );
      },


    );
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    Map<String, dynamic> userJson = user.toJson();
    print("user in nsert ${user.name} == ${user.email}");
    print("userJson in Insert ${userJson['name'] } == ${userJson['email']}");
    return await db.insert(usersTable, userJson);
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      usersTable,
      where: "email = ?",
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    } else {
      return null;
    }
  }


  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(usersTable, where: "id = ?", whereArgs: [id]);
  }


  Future<int> insertCartItem(CartItem cartItem) async {
    final db = await database;
    Map<String, dynamic> cartItemJson = cartItem.toJson();
     print("cartItemJson in Insert ${cartItemJson['name'] } == ${cartItemJson['category']}");
    return await db.insert(cartItemTable, cartItemJson);
  }

  Future<List<CartItem>?> getAllCartItems() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      cartItemTable,
    );

    List<CartItem> cartItems = [];
    if (result.isNotEmpty) {
      for(var item in result){
       CartItem cart =  CartItem.fromJson(item);
       cartItems.add(cart);
      }
      return cartItems;
    } else {
      return null;
    }
  }


  Future<int> deleteCartItem(int id) async {
    final db = await database;
    return await db.delete(cartItemTable, where: "id = ?", whereArgs: [id]);
  }

}
