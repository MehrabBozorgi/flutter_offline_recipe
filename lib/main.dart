import 'package:flutter/material.dart';
import 'package:flutter_online_shop/model/dummy_data.dart';
import 'package:flutter_online_shop/screen/categories_screen.dart';
import 'package:flutter_online_shop/screen/meals_screen.dart';
import 'package:flutter_online_shop/screen/filter_screen.dart';
import 'package:flutter_online_shop/screen/meal_detail_screen.dart';
import 'package:flutter_online_shop/screen/tab_screen.dart';

import 'model/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final exitingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exitingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Colors.purple[100],
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'tabs_screen',
      routes: {
        'tabs_screen': (context) => TabScreen(_favoriteMeals),
        'category_screen': (context) => CategoriesScreen(),
        'category_meals': (context) => MealsScreen(_availableMeals),
        'meal_screen_detail': (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        'filter_screen': (context) => FilterScreen(_setFilters, _filters),
      },
    );
  }
}
