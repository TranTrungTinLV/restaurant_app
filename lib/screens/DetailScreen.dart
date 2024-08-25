import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class Detailscreen extends StatefulWidget {
   Detailscreen({super.key, required this.meal,  required this.onToggleFavorite, required this.like});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
    bool like;

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}
class _DetailscreenState extends State<Detailscreen> {

  @override

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết về món ăn',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            widget.onToggleFavorite(widget.meal);
            setState(() {
              widget.like = !widget.like;
            });
          }, icon: Icon(Icons.star,color: widget.like ? Colors.red : Colors.white,))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
                fadeInDuration: Duration(microseconds: 12),
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                image:
                NetworkImage(widget.meal.imageUrl)),
            Text('Ingredients',style: TextStyle(color: Colors.red,fontSize: 30),),
            for(final ingredient in widget.meal.ingredients)
              Text(ingredient,style: TextStyle(color: Colors.white),),
            SizedBox(height: 10,),
            Text('Steps',style: TextStyle(color: Colors.red,fontSize: 30),),

            for(final step in widget.meal.steps)
              Text('- $step',style: TextStyle(color: Colors.white),),
            SizedBox(height: 50,)
          ],
        ),
      )

    );

  }
}

