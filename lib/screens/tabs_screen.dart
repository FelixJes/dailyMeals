import 'package:dailymeals/models/meal.dart';
import 'package:dailymeals/screens/categories_screen.dart';
import 'package:dailymeals/screens/favoritesScreen.dart';
import 'package:dailymeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  TabScreen(
    this.favoriteMeals,
    {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final _pages = [
    CategoriesScreen(),
    FavoritesScreen(widget.favoriteMeals),
  ];

  int _selectedPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 15,
          unselectedFontSize: 15,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category_sharp),
                label: 'Categories'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.favorite_rounded),
                label: 'Favorites'),
          ]),
    );
  }
}
