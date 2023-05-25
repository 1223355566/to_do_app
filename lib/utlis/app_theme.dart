import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: App_color.primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      canvasColor: App_color.primaryColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(color: App_color.secondaryColor,size: 45),
          unselectedIconTheme: IconThemeData(color: App_color.secondaryColor,size: 35),


          selectedLabelStyle: TextStyle(fontSize: 14,color: App_color.secondaryColor)
      ),
      textTheme: TextTheme(
          bodySmall: TextStyle(
              color: App_color.secondaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w500),
          //Sura name
          displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          // tasabehcounter,tasbehname
          displayMedium:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
// counter,
          titleSmall: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          //Ahadethname/Quran
          titleMedium: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20), //setting,lang

          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          bodyMedium: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,)
      )

  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: App_color.primaryColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: App_color.primaryColorDark,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: App_color.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(color: App_color.secondaryColorDark,size: 45),
      unselectedIconTheme: IconThemeData(color: App_color.whiteColor,size: 35),
      selectedLabelStyle: TextStyle(fontSize: 14,color: App_color.secondaryColor),
    ),
    textTheme: TextTheme(
        bodySmall: TextStyle(
            color: App_color.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.w500),
        //Sura name
        displayLarge: TextStyle(
            color: App_color.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w500),
        // tasabehcounter,tasbehname
        displayMedium: TextStyle(
            color: App_color.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
// counter,
        titleSmall: TextStyle(
            color: App_color.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        //Ahadethname/Suraname
        titleMedium: TextStyle(
            color: App_color.secondaryColorDark,
            fontWeight: FontWeight.bold,
            fontSize: 20), //setting,lang
        headlineSmall:  TextStyle(color: App_color.primaryColorDark,fontWeight: FontWeight.bold, fontSize:14),
        bodyMedium: TextStyle(
            color: App_color.whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: App_color.secondaryColorDark)),


  );
}
