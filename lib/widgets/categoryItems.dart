import 'package:flutter/material.dart';

class Categoryitems extends StatelessWidget {
  const Categoryitems({super.key, required this.noteText, required this.colors, required this.onTap});
  final String noteText;
  final Color? colors;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(

        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.all(Radius.circular(10)),

          gradient: LinearGradient(colors: [
            colors!.withOpacity(0.55),
            colors!.withOpacity(0.9)
          ],begin: Alignment.topLeft,end: Alignment.bottomRight)


        ),
        padding: const EdgeInsets.all(20),
      
        child:  Text(noteText,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ),
    );
  }
}
