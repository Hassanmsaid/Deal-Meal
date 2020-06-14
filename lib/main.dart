import 'package:dealmeal/model/filters_data.dart';
import 'package:dealmeal/screens/filters_screen.dart';
import 'package:dealmeal/screens/meal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FiltersData>(
      create: (BuildContext context) {
        return FiltersData();
      },
      child: MaterialApp(
        title: 'Deal Meal',
        theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.amberAccent),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(),
          CategoriesScreen.id: (context) => CategoriesScreen(),
          CategoryMealsScreen.id: (context) => CategoryMealsScreen(),
          MealDetailsScreen.id: (context) => MealDetailsScreen(),
          FiltersScreen.id: (context) => FiltersScreen(),
        },
      ),
    );
  }
}
