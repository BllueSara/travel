// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
        title: Text(
          'التصفية',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _changeFilter,
            icon: Icon (Icons.save),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTheme(
                    'الرحلات الصيفية', "اظهار الرحلات الصيفية فقط", _isInSummer,
                    (newValue) {
                  setState(() {
                    _isInSummer = newValue;
                  });
                }),
                buildSwitchTheme(
                    'الرحلات الشتوية', "اظهار الرحلات الشتوية فقط", _isInWinter,
                    (newValue) {
                  setState(() {
                    _isInWinter = newValue;
                  });
                }),
                buildSwitchTheme('الرحلات العائلية',
                    "اظهار الرحلات العائلية فقط", _isForFamily, (newValue) {
                  setState(() {
                    _isForFamily = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchTheme buildSwitchTheme(String title, String subtitle, bool currentValue,
      ValueChanged<bool> updateValue) {
    return SwitchTheme(
      data: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.white!),
        trackColor: MaterialStateProperty.all<Color>(Colors.brown[300]!),
      ),
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue,
      ),
    );
  }
}
