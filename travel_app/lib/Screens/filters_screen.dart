
// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, deprecated_member_use, prefer_const_constructors_in_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;
  @override
  initState() {
    _Summer = widget.currentFilters['summer'] ?? false;
    _Winter = widget.currentFilters['winter'] ?? false;
    _Family = widget.currentFilters['family'] ?? false;
    super.initState();
  }

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
            onPressed: () {
              final selectedFilters = {
                'summer': _Summer,
                'wimter': _Winter,
                'family': _Family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
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
                    'الرحلات الصيفية', "اظهار الرحلات الصيفية فقط", _Summer,
                    (newValue) {
                  setState(() {
                    _Summer = newValue;
                  });
                }),
                buildSwitchTheme(
                    'الرحلات الشتوية', "اظهار الرحلات الشتوية فقط", _Winter,
                    (newValue) {
                  setState(() {
                    _Winter = newValue;
                  });
                }),
                buildSwitchTheme(
                    'الرحلات العائلية', "اظهار الرحلات العائلية فقط", _Family,
                    (newValue) {
                  setState(() {
                    _Family = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }SwitchTheme buildSwitchTheme(String title, String subtitle, var currentValue,
      ValueChanged<bool> updateValue) {
    return SwitchTheme(
      data: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.white),
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