import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
// import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/providers/meals_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filterScreen.dart';
import 'package:meals_app/screens/meals.dart';


const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
  Filter.lactoseFree: false,

};
class TabsCategories extends ConsumerStatefulWidget {
  const TabsCategories({super.key});

  @override
  ConsumerState<TabsCategories> createState() => _TabsCategoriesState();
}

class _TabsCategoriesState extends ConsumerState<TabsCategories> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  bool isCheckStar = false;
  Map<Filter,bool> selectedFilter = kInitialFilters;
  void showInfoMessage(String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  void _toogleMealsFarvorite(Meal meal){
    final isExsting = _favoriteMeals.contains(meal);
    print('isExsiting $isExsting');
    setState(() {
      if(isExsting){
        _favoriteMeals.remove(meal);
        print("Removed from favorites: ${meal.title}");
        showInfoMessage('Remove');
      }else{
        _favoriteMeals.add(meal);
        print("Add from favorites: ${meal.title}");
        showInfoMessage('add');
      }
    });

  }

  void onSelectScreen(String indetifier) async {
    if(indetifier == 'filters'){
      // Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: selectedFilter,
          ),
        ),
      );
      print(result);
     setState(() {
       selectedFilter = result ?? kInitialFilters;
     });

     if (result != null) {
       print("Result $result"); // This will print the result when returning from FiltersScreen
     }
    }
  }

  bool isMealFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }


  void selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final available = meals.where((isFilter) {
      if(selectedFilter[Filter.glutenFree]! && !isFilter.isGlutenFree) {
        return false;
      }
      if(selectedFilter[Filter.lactoseFree]! && !isFilter.isLactoseFree) {
        return false;
      }
      if(selectedFilter[Filter.vegan]! && !isFilter.isVegan) {
        return false;
      }
      if(selectedFilter[Filter.vegetarian]! && !isFilter.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage =  CategoriesScreen(onToggleFavorite: _toogleMealsFarvorite, like: isMealFavorite, availableMeals: available,);
    var activePageTitle = 'Categories';

    if(_selectedPageIndex == 1){
      activePage = MealsScreen( meals: _favoriteMeals, onToggleFavorites: _toogleMealsFarvorite, title: '', like: isMealFavorite,);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(

        title: Text(activePageTitle),
  
      ),
      drawer: Drawer(
        // width: 202,
        // elevation: 9,
        child: Column(
          children: [
            DrawerHeader(padding: EdgeInsets.all(20),decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ],
               begin: Alignment.topLeft,
              end: Alignment.bottomRight),
            ),
              child: Row(
                children: [
                  Icon(Icons.fastfood,size: 50,),
                  SizedBox(width: 20.0,),
                  Text('Menu',style: TextStyle(color: Colors.white),),
                ],
              )
            ),
            ListTile(
                title: Row(
                  children: [
                    Icon(Icons.restaurant),
                    SizedBox(width: 10,),
                    Text('Meals', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 24,
                              ),),]
                ),onTap: (){
              onSelectScreen('meals');

            },),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text('Filters', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),),
                ],
              ),onTap: (){
              onSelectScreen('filters');

            },)
          ],
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: selectPage,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Meals'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'My Favorites'),
      ],),

    );
  }
}
