// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:flutter/material.dart';
import 'package:travel_app/Screens/trip_detail_screen.dart';
import 'package:travel_app/models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
 final void Function(String) removeItem;

  const TripItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season, 
    required this.id,
    required this.removeItem,
  });

  String get seasoneText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      case Season.Summer:
        return 'صيف';
        break;
    }
  }

  String get tripTypyText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Activites:
        return 'انشطة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
    }
  }

 void selectTrip(BuildContext context, String id) {
  Navigator.of(context).pushNamed(TripDetailScreen.screenRoute, arguments: id)
      .then((result) {
    if (result != null) {
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () => selectTrip(context, id),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 7, // شفافيه للخلففية
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 200,
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                            stops: [
                          0.6,
                          1,
                        ])),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.today,
                          color: Colors.brown[300],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '$duration ايام',
                          style: TextStyle(color: Colors.brown[300]),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.brown[300],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          seasoneText,
                          style: TextStyle(color: Colors.brown[300]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.family_restroom,
                          color: Colors.brown[300],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          tripTypyText,
                          style: TextStyle(color: Colors.brown[300]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
