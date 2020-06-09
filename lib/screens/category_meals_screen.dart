import 'package:dealmeal/model/category.dart';
import 'package:dealmeal/utils/dummy_data.dart';
import 'package:dealmeal/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const id = 'category_meals_screen';

//  final Category category;
//  CategoryMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Category category = routArgs['category'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
