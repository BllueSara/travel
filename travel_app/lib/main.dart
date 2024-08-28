
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/Screens/categories_trips.dart';
import 'package:travel_app/Screens/filters_screen.dart';
import 'package:travel_app/Screens/tabs_screen.dart';
import 'package:travel_app/Screens/trip_detail_screen.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'wimter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _mangeFavorite(String tripId) {
    final existingIndex = _favoriteTrips.indexWhere(
      (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

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
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoriesTrips.screenRouts: (ctx) => CategoriesTrips(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(_mangeFavorite,_isFavorite),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilter),
      },
    );
  }
}