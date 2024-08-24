// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});
  static const screenRoute = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('التصفية'),
      ),
      body: Center(
        child: Text(
          'هذه صفحة التصفية',
        ),
      ),
    );
  }
}
