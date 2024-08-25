import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';

import 'package:meals_app/widgets/card_items.dart';

class MealsScreen extends StatelessWidget {
   MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavorites, required this.like});
   String? title;
   List<Meal> meals ;
   final bool Function(Meal meal) like;
   final void Function(Meal meal) onToggleFavorites;
  @override
  Widget build(BuildContext context) {

    Widget content = Center(child: SizedBox(width: 200,child: Text('Uh Xin lỗi hiện tại đang có vấn đề xảy ra',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),)));
    // if(title == null){
    //   return content;
    // }
    return Scaffold(
      appBar: AppBar(
        title:  Text(title!,style: TextStyle(color: Colors.white),) ,
        centerTitle: true,
      ),
      body: meals.isEmpty || (title == null)  ?  content :  ListView.builder(
          itemCount: meals.length,
          itemBuilder: (BuildContext ctx,int index){
        return CardItems(meals: meals[index], onToggleFavorite: onToggleFavorites, like: like,);
        // );
      }),
    );
  }
}

