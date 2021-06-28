import 'package:flutter/material.dart';
import 'package:flutter_online_shop/item/main_drawer.dart';
import 'package:flutter_online_shop/item/meal_item.dart';
import 'package:flutter_online_shop/model/meals.dart';

class FavoriteScreen extends StatelessWidget {
  static const routName = 'favorite_screen';

  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('is Empty'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals!.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals![index].id,
            title: favoriteMeals![index].title,
            imageUrl: favoriteMeals![index].imageUrl,
            duration: favoriteMeals![index].duration,
            complexity: favoriteMeals![index].complexity,
            affordability: favoriteMeals![index].affordability,
          );
        },
      );
    }
  }
}
