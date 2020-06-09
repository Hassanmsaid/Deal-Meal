import 'package:dealmeal/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  Widget buildDrawerItem(String title, IconData icon, Function onPressed) {
    return ListTile(
      leading: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              alignment: Alignment.center,
              color: Theme.of(context).accentColor,
              child: Text(
                'Lets Cook!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            buildDrawerItem(
              'Meals',
              Icons.restaurant,
              () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            buildDrawerItem('Filters', Icons.tune, () {
              Navigator.pushReplacementNamed(context, FiltersScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
