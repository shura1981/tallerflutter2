import 'package:flutter/material.dart';

class AppTheme {
  //Theme Light
  static const Color lightPrimaryColorLight = Colors.black;
  static const Color lightPrimaryColor = Colors.purpleAccent;
  static  Color? lightscaffoldBackgroundColor = Colors.grey[100];

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: lightPrimaryColor,
    primaryColorLight: lightPrimaryColorLight,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
    // appBarTheme: AppBarTheme(color: lightPrimaryColor, elevation: 0, foregroundColor: lightscaffoldBackgroundColor),
    // scaffoldBackgroundColor: lightscaffoldBackgroundColor,
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(foregroundColor: lightPrimaryColor)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // backgroundColor: lightPrimaryColor, 
        elevation: 5,
        enableFeedback: true,
        ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         // backgroundColor: lightPrimaryColor,
    //         shape: const StadiumBorder(),
    //         elevation: 0)),
    inputDecorationTheme: InputDecorationTheme(

      focusColor: Colors.white,
      filled: true,
      fillColor: Colors.grey.shade200,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightPrimaryColor),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    
  );

//Theme dark
  static const Color darktPrimaryColorLight = Colors.grey;
  static const Color darkPrimaryColor = Colors.blue;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: darkPrimaryColor,
      primaryColorLight: darktPrimaryColorLight,
      appBarTheme: AppBarTheme(color: darkPrimaryColor, elevation: 0));
}
