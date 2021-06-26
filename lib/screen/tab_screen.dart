import 'package:flutter/material.dart';
import 'package:flutter_online_shop/item/main_drawer.dart';
import 'package:flutter_online_shop/model/meals.dart';
import 'package:flutter_online_shop/screen/categories_screen.dart';
import 'package:flutter_online_shop/screen/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  static const routName = 'tabs_screen';

  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.black45,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}
