import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/screens/DetailScreen.dart';
import 'package:transparent_image/transparent_image.dart';

import 'Meals_trait.dart';

class CardItems extends StatelessWidget {

  const CardItems({super.key, required this.meals,  required this.onToggleFavorite, required this.like});
  final Meal meals;
  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) like; // Changed to a function
  // final bool like;
  String get complixtyText {
    return meals.complexity.name[0].toUpperCase() + meals.complexity.name.substring(1);
  }
  String get affordabilityText {
    return meals.affordability.name[0].toUpperCase() + meals.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: (){
          // if(onToggleFavorite == null) return;
         Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Detailscreen(meal: meals, onToggleFavorite: onToggleFavorite, like: like(meals),)));
        },
        child: Stack(
          children: [
            FadeInImage(
              image: NetworkImage(
                meals.imageUrl,
              ),
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
            ),
            // for(final gradient in meals[index].ingredients)
            //   Text(gradient),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                color: Colors.black54,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(meals.title,style: TextStyle(color: Colors.white),),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealsTrait(label: meals.duration.toString(), icon: Icons.schedule),
                        SizedBox(width: 12,),
                        MealsTrait(label: complixtyText.toString(), icon: Icons.schedule),
                        SizedBox(width: 12,),
                        MealsTrait(label: affordabilityText.toString(), icon: Icons.attach_money),


                      ],
                    ),

                  ],

                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
