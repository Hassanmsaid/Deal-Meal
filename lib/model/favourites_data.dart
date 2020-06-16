import 'package:dealmeal/model/meal.dart';
import 'package:dealmeal/utils/dummy_data.dart';
import 'package:flutter/material.dart';

class FavouritesData extends ChangeNotifier {
  List<Meal> favouriteMeals = [];

  void toggleMeal(String mealId) {
    final mealIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    mealIndex > -1
        ? favouriteMeals.removeAt(mealIndex)
        : favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
  }
}
