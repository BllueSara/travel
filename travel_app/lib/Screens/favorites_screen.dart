// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';

class FavoritesScreen extends StatelessWidget {


  final List <Trip> favoritesTrips;

  const FavoritesScreen({super.key, required this.favoritesTrips});
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ليس لديك اي رحلة في قائمة الرحلات المفضلة'),
    );
  }
}