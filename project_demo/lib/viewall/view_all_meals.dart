import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../home/widgets/special_offer_item.dart';
import '../local/database_helper.dart';
import '../models/category_details.dart';
import '../service/service_api.dart';

class ViewAllMeals extends StatefulWidget {
  const ViewAllMeals({super.key, required this.category});

  final String category;

  @override
  State<ViewAllMeals> createState() => _ViewAllMealsState();
}

class _ViewAllMealsState extends State<ViewAllMeals> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var service = CategoryService();
  late Future<List<Meal>> meals;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meals = service.getCategoryDetails(widget.category); // ← category passed properly

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals of ${widget.category} Category")),
      body: FutureBuilder<List<Meal>>(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final list = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return MealItem(category: list[index]);
              },
            );
          } else {
            return const Center(child: Text("No meals found."));
          }
        },
      ),
    );
  }

}
