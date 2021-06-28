import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    required this.title,
    required this.color,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          'category_meals',
          arguments: {
            'id': id,
            'title': title,
            'color': color,
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title),
      ),
    );
  }
}
