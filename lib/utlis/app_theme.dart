import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: App_color.primaryColor,
        scaffoldBackgroundColor: App_color.accentColor,
   appBarTheme: AppBarTheme(
     backgroundColor: App_color.primaryColor,
     elevation: 0,
     titleTextStyle: TextStyle(
       fontSize: 22,
       fontWeight: FontWeight.bold,
       color: App_color.whiteColor,


     )



    ),




    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: App_color.whiteColor,
      selectedItemColor: App_color.primaryColor,
      unselectedItemColor: App_color.darkGrey,
      selectedIconTheme: const IconThemeData(size: 22),
      showSelectedLabels: false,
        showUnselectedLabels: false
    ),

textTheme: TextTheme(
  bodyMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: App_color.primaryColor
  ),//tile of note
  //todo:use this for item title,
bodySmall:TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: App_color.darkGrey
) ,//todo:use this for description title,
titleMedium: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: App_color.primaryColor
)
)




  );

  static ThemeData darkTheme = ThemeData();
}
