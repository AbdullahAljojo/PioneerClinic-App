import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

Map<int, Color> colorSwatch(int primaryColorHex) {
  return {
    50: Color(primaryColorHex).withOpacity(0.1),
    100: Color(primaryColorHex).withOpacity(0.2),
    200: Color(primaryColorHex).withOpacity(0.3),
    300: Color(primaryColorHex).withOpacity(0.4),
    400: Color(primaryColorHex).withOpacity(0.5),
    500: Color(primaryColorHex).withOpacity(0.6),
    600: Color(primaryColorHex).withOpacity(0.7),
    700: Color(primaryColorHex).withOpacity(0.8),
    800: Color(primaryColorHex).withOpacity(0.9),
    900: Color(primaryColorHex).withOpacity(1.0),
  };
}
// Your custom primary color (e.g., a shade of blue)
const int primaryColorHex = 0xFF11CCC3;

// Create the MaterialColor for the custom primary color
final MaterialColor customPrimarySwatch = MaterialColor(primaryColorHex, colorSwatch(primaryColorHex));

ThemeData light = ThemeData(
  //primarySwatch: Colors.teal,
  primarySwatch:customPrimarySwatch,

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
      // backwardsCompatibility: false,
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
  //HexColor('333739') ,
  primarySwatch:customPrimarySwatch,
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
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:HexColor('333739') ,
          statusBarIconBrightness: Brightness.light)),
);
