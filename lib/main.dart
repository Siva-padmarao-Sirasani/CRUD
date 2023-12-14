import 'package:flutter/material.dart';

import 'HomeScreen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(editDetails: {'title': 'Default Title', 'description': 'Default Description'},
        onUpdate: (editedDetails) {
          // Handle the update logic if needed
        },),
    ),
  );
}