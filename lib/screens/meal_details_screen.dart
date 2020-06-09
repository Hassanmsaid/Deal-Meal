import 'package:dealmeal/model/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const id = 'meal_details';

  Widget buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  Widget buildSection(Widget child) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF556699)),
            borderRadius: BorderRadius.circular(8)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      backgroundColor: Color(0xFFfff2a6),
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(meal.imageUrl),
          buildSectionTitle('Ingrediants'),
          buildSection(
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: meal.ingredients.length,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    meal.ingredients[i],
                  ),
                );
              },
            ),
          ),
          buildSectionTitle('Steps'),
          buildSection(
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: meal.steps.length,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('#${i + 1}'),
                    ),
                    title: Text(
                      meal.steps[i],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
