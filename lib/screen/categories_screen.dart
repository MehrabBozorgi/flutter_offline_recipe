import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/item/category_item.dart';
import 'package:flutter_online_shop/item/main_drawer.dart';
import 'package:flutter_online_shop/model/dummy_data.dart';

/////////
//صفحه اصلی
/////////
class CategoriesScreen extends StatelessWidget {
  static const routName = 'category_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: GridView(
        padding: EdgeInsets.all(20),

        // برای اینکه تعداد اجزای لیستش محدوده از این روش و بدون
        // builder
        // انجامش داده
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
