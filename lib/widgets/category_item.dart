import 'package:dealmeal/model/category.dart';
import 'package:dealmeal/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  CategoryItem(this._category);

  void openMeals(BuildContext context) {
//    Navigator.push(context,
//        MaterialPageRoute(builder: (_) => CategoryMealsScreen(_category)));
    Navigator.pushNamed(context, CategoryMealsScreen.id,
        arguments: {'category': _category});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openMeals(context),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Text(
          _category.name,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [_category.color.withOpacity(0.8), _category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
