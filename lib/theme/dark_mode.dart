// dark theme
import 'package:flutter/material.dart';

ThemeData dark_theme = ThemeData(
  fontFamily: "Cambo",
  // brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: primaryDarkBlue,

    // primaryColorDark: primaryDarkBlue[700],
  ).copyWith(
    secondary: primaryYellow,
    // tertiary: primaryDarkBlue,
  ),
  primaryColor: primaryDarkBlue[50],
  // canvasColor: primaryDarkBlue[50],

  // inputDecorationTheme: InputDecorationTheme(
  //   iconColor: primaryYellow,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  // )
  appBarTheme: AppBarTheme(
    color: primaryDarkBlue[50],
    elevation: 0,

  ),

  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.disabled)) {
      return primaryYellow.withOpacity(.32);
    }
    return primaryYellow;
  })),
  tabBarTheme: TabBarTheme(
    // indicatorColor: ,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: primaryYellow,
          width: 5,
        ),
      ),
      // borderRadius: BorderRadius.circular(10),
      // color: primaryYellow,
    ),
    labelColor: primaryYellow[50],
    unselectedLabelColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      fontSize: 18,
    ),
    labelStyle: TextStyle(
      fontSize: 18,
    ),
  ),
  focusColor: primaryYellow,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  toggleableActiveColor: primaryYellow,
);

// dark theme colors

const MaterialColor primaryDarkBlue = MaterialColor(
  _blueDarkPrimaryValue,
  <int, Color>{
    50: Color(0xFF6680B3),
    100: Color(0xFF6680B3),
    200: Color(0xFF6680B3),
    300: Color(0xFF6680B3),
    400: Color(0xFF6680B3),
    500: Color(_blueDarkPrimaryValue),
    600: Color(0xFF6680B3),
    700: Color(0xFF6680B3),
    800: Color(0xFF6680B3),
    900: Color(0xFF6680B3),
  },
);

const int _blueDarkPrimaryValue = 0xFF6680B3;

const MaterialColor primaryYellow = MaterialColor(
  _DarkYellowPrimaryValue,
  <int, Color>{
    50: Color(0xFFD2AF39),
    100: Color(0xFFD2AF39),
    200: Color(0xFFD2AF39),
    300: Color(0xFFD2AF39),
    400: Color(0xFFD2AF39),
    500: Color(_DarkYellowPrimaryValue),
    600: Color(0xFFD2AF39),
    700: Color(0xFFD2AF39),
    800: Color(0xFFD2AF39),
    900: Color(0xFFD2AF39),
  },
);
const int _DarkYellowPrimaryValue = 0xFFD2AF39;
