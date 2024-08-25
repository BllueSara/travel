// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field, must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/Screens/categories_trips.dart';
import 'package:travel_app/Screens/filters_screen.dart';
import 'package:travel_app/Screens/tabs_screen.dart';
import 'package:travel_app/Screens/trip_detail_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  Map<String , bool> _filters = {
   'summer' : false,
   'wimter' : false,
    'family' : false,
  };

  void _changeFilter(Map<String , bool > filterData){
    
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
        // Spanish
      ],
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesTrips.screenRouts : (ctx) => CategoriesTrips(),
        TripDetailScreen.screenRoute:(ctx) => TripDetailScreen(),
        FiltersScreen.screenRoute:(ctx) => FiltersScreen(),
      },
    );
  }
}
