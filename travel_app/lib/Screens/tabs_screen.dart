// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/Screens/categories_Screen.dart';
import 'package:travel_app/Screens/favorites_screen.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;

  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selestedScreenIndex = index;
    });
  }

  int _selestedScreenIndex = 0;

  late List<Map<String, Object>> _screen;
  @override
  void initState() {
    _screen = [
      {
        'Screen': CategorisScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // تحويل القيم إلى الأنواع المناسبة
    final selectedScreen = _screen[_selestedScreenIndex]['Screen'] as Widget;
    final selectedTitle = _screen[_selestedScreenIndex]['Title'] as String;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
        title: Text(
          selectedTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300], // تحديد اللون غير المحدد
        currentIndex: _selestedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Colors.brown[300],
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[400], // تحديد اللون غير المحدد
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
             
            ),
            label: 'المفضله',
          ),
        ],
      ),
    );
  }
}
