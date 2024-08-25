
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:meals_app/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main (){
  runApp(ProviderScope(child: MyApp()));
}
final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 131, 57, 0))
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabsCategories()
      // MealsScreen(meals: dummyMeals,title: 'Some data',),
    );
  }
}
