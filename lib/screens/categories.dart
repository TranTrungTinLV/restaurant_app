import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/categoryItems.dart';

import '../data/dummy_data.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.like, required this.availableMeals});
  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) like;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category categories){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealsScreen(title: 'Danh sách món ăn', meals: availableMeals.where((meal)=>meal.categories.contains(categories.id),).toList(), onToggleFavorites: onToggleFavorite, like: like,)));
  }
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var currentIndexCategories = 0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn danh mục món ăn'),
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,

        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(24),
        childAspectRatio: 3/2,


        children: [
          for(final category in availableCategories)
             Categoryitems(noteText: category.title, colors: category.color, onTap: (){
               widget._selectCategory(context,category);
             },)

        ],
      ),
    );
  }
}
