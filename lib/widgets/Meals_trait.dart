import 'package:flutter/material.dart';

class MealsTrait extends StatelessWidget {
   MealsTrait({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
       Icon(icon,color: Colors.white,size: 20,),
      SizedBox(width: 5,),
        Text(label,style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
