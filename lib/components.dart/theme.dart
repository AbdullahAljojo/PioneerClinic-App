import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.white,
  // textTheme: TextTheme(bodyText1:  TextStyle(
  //   fontSize: 14,
  //   color: Colors.black,
  //   fontWeight: FontWeight.w600
  // ) ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark)),
);


ThemeData dark = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:HexColor('333739') ,
      unselectedItemColor: Colors.white,
      elevation: 50),
  scaffoldBackgroundColor: HexColor('333739') ,
  primarySwatch: Colors.teal,
  // textTheme: TextTheme(bodyText1: TextStyle(
  //   fontSize: 14,
  //   color: Colors.white,
  //   fontWeight: FontWeight.w600
  // )),
  appBarTheme: AppBarTheme(
      backgroundColor:HexColor('333739') ,
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      iconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:HexColor('333739') ,
          statusBarIconBrightness: Brightness.light)),
);
