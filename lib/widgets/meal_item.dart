import 'package:cached_network_image/cached_network_image.dart';
import 'package:dealmeal/model/meal.dart';
import 'package:dealmeal/screens/meal_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, MealDetailsScreen.id, arguments: meal),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: meal.imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      backgroundColor: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.access_time,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(meal.getAffordability),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.work,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(meal.getComplexity),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
