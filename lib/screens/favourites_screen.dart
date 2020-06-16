import 'package:dealmeal/model/favourites_data.dart';
import 'package:dealmeal/model/meal.dart';
import 'package:dealmeal/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Meal> favouriteMeals;

  @override
  Widget build(BuildContext context) {
    setState(() {
      favouriteMeals = Provider.of<FavouritesData>(context).favouriteMeals;
    });

    return Consumer<FavouritesData>(
      builder: (BuildContext context, FavouritesData value, Widget child) {
        return favouriteMeals.isEmpty
            ? Center(
                child: Text('You have no favourites yet!'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(favouriteMeals[index], null);
                },
                itemCount: favouriteMeals.length,
              );
      },
    );
  }
}
