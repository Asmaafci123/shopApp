import 'package:flutter/material.dart';
ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: Color(0xFF4A4A4A),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4A4A4A),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        elevation: 0.0,
        actionsIconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xFF4A4A4A),
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )
    ),
    fontFamily: 'Oswald'
);
ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        elevation: 0.0,
        actionsIconTheme: IconThemeData(
            color: Colors.black
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme( //make override
        bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold
        )
    ),
  fontFamily: 'Oswald'
);