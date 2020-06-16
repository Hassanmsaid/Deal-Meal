import 'package:dealmeal/model/category.dart';
import 'package:dealmeal/model/filters_data.dart';
import 'package:dealmeal/model/meal.dart';
import 'package:dealmeal/utils/dummy_data.dart';
import 'package:dealmeal/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const id = 'category_meals_screen';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> displayedMeals = [];

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// gets selected category from previous screen
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    category = routArgs['category'];

    Map<String, bool> filters = Provider.of<FiltersData>(context).filters;
    displayedMeals = DUMMY_MEALS.where((meal) {
      if (!meal.isGlutenFree && filters['gluten']) return false;
      if (!meal.isLactoseFree && filters['lactose']) return false;
      if (!meal.isVegan && filters['vegan']) return false;
      if (!meal.isVegetarian && filters['vegetarian']) return false;
      if (meal.categories.contains(category.id)) return true;
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(displayedMeals[index], _removeMeal);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
