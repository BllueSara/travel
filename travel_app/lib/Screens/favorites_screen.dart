
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoritesTrips;

  FavoritesScreen(this.favoritesTrips);

  @override
  Widget build(BuildContext context) {
    if (favoritesTrips.isEmpty) {
      return Center(
        child: Text('ليس لديك اي رحلة في قائمة الرحلات المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoritesTrips[index].id,
            title: favoritesTrips[index].title,
            imageUrl: favoritesTrips[index].imageUrl,
            duration: favoritesTrips[index].duration,
            tripType: favoritesTrips[index].tripType,
            season: favoritesTrips[index].season,
            //removeItem: _removeTrip,
          );
        },
        itemCount: favoritesTrips.length,
      );
    }
  }
}
