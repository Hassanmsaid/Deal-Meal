import 'package:dealmeal/screens/categories_screen.dart';
import 'package:dealmeal/screens/favourites_screen.dart';
import 'package:dealmeal/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _screens = [CategoriesScreen(), FavouritesScreen()];
  int _screenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEAL MEAL'),
      ),
      body: _screens[_screenIndex],
      drawer: NavDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourites'),
          ),
        ],
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).primaryColorDark,
        currentIndex: _screenIndex,
      ),
    );
  }
}
