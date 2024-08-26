// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_string_interpolations, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  Widget buildSectionTitle(String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: TextStyle(
          color: Colors.brown[300],
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget buildListViweContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
        title: Text(
          ' ${selectedTrip.title} ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedTrip.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildSectionTitle('الانشطة'),
          buildListViweContainer(
            ListView.builder(
              itemCount: selectedTrip.activites.length,
              itemBuilder: (ctx, index) => Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedTrip.activites[index]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildSectionTitle('البرنامج اليومي'),
          buildListViweContainer(
            ListView.builder(
              itemCount: selectedTrip.program.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown[300],
                      child: Text('يوم ${index + 1}' , style: TextStyle(color: Colors.white),),
                    ),
                    title: Text(selectedTrip.program[index]),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[300],
        child: Icon(Icons.star , color: Colors.white,),
        onPressed: () {
          
        },
      ),
    );
  }
}
