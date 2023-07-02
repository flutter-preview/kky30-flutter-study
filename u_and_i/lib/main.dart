import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 80,
            fontFamily: 'parisienne',
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    )
  );
}