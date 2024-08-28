// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoriesTrips extends StatefulWidget {
  static const screenRouts = '/category-trips';
  final List<Trip> availableTrips;
  CategoriesTrips(this.availableTrips);

  @override
  State<CategoriesTrips> createState() => _CategoriesTripsState();
}

class _CategoriesTripsState extends State<CategoriesTrips> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  bool _isInitalized = false;
  @override
  void didChangeDependencies() {
    if (!_isInitalized) {
      final routeArgument =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgument['id'];
      categoryTitle = routeArgument['title']!;
      displayTrips = widget.availableTrips.where((trip) {
        return trip.Categoties.contains(categoryId);
      }).toList();
      _isInitalized = true;
    }
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // استخراج البيانات من ModalRoute
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
        title: Text(
          categoryTitle!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            //  removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
