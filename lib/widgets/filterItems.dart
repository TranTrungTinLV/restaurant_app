import 'package:flutter/material.dart';

class Filteritems extends StatefulWidget {
   Filteritems({super.key, required this.lights, required this.title, required this.subtitle});
    bool lights;
    // final void Function(bool newValue) onChange;
   final String title;
   final String subtitle;

  @override
  State<Filteritems> createState() => _FilteritemsState();
}

class _FilteritemsState extends State<Filteritems> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: widget.lights,
        onChanged: (isChecked) {
      setState(() {
        widget.lights = isChecked;
      });
    },
    title: Text(
    widget.title,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
    color: Theme.of(context).colorScheme.onBackground,
    ),
    ),);
  }
}

