import 'package:dealmeal/utils/dummy_data.dart';
import 'package:dealmeal/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static final id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: DUMMY_CATEGORIES.map((cat) => CategoryItem(cat)).toList(),
    );
  }
}
