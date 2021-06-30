import 'package:flutter/material.dart';
import 'package:flutter_online_shop/item/meal_item.dart';
import 'package:flutter_online_shop/model/meals.dart';

class MealsScreen extends StatefulWidget {
  static const routName = 'category_meals';

  final List<Meal> availableMeals;

  const MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String? catTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

      final catId = routeArg['id'];
      catTitle = routeArg['title'];

      // با استفاده از
      //  catId
      // ای دی مورد نظر رو به متغیره پاس دادیم
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: ListView.builder(
        itemCount: displayedMeals!.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
          );
        },
      ),
    );
  }
}
