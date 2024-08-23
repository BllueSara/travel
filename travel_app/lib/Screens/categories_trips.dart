import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';

class CategoriesTrips extends StatelessWidget {

static const screenRouts = '/category-trips';

  @override
  Widget build(BuildContext context) {
    // استخراج البيانات من `ModalRoute`
    final routeArguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    
    // تعيين القيم باستخدام `routeArguments`
    final categoryTitle = routeArguments?['title'] ;
    final categoryId = routeArguments?['id'] ;
    final filteredTrips = Trips_data.where((trip) {
      return trip.Categoties.contains(categoryId); // تأكد من أن هذا يتطابق مع بياناتك
    }).toList();

    return Scaffold(
      appBar: AppBar(
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
        return Text(filteredTrips[index].title , style: TextStyle(color: Colors.brown),);
        },
        itemCount:filteredTrips.length ,
      ),
    );
  }
}
