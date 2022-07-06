import 'package:flutter/material.dart';

// light theme
ThemeData light_theme = ThemeData(
  fontFamily: "Cambo",
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: primaryBlue,
  )
      .copyWith(
        secondary: primaryYellow,
      )
      .copyWith(
        tertiary: primaryYellow,
      ),
  // inputDecorationTheme: InputDecorationTheme(
  //   iconColor: primaryYellow,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  // ),
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

// light theme colors
const MaterialColor primaryBlue = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFF00369E),
    100: Color(0xFF00369E),
    200: Color(0xFF00369E),
    300: Color(0xFF00369E),
    400: Color(0xFF00369E),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF00369E),
    700: Color(0xFF00369E),
    800: Color(0xFF00369E),
    900: Color(0xFF00369E),
  },
);

const int _bluePrimaryValue = 0xFF00369E;

const MaterialColor primaryYellow = MaterialColor(
  _yellowPrimaryValue,
  <int, Color>{
    50: Color(0xFFD2AF39),
    100: Color(0xFFB6860A),
    200: Color(0xFFB6860A),
    300: Color(0xFFB6860A),
    400: Color(0xFFB6860A),
    500: Color(_yellowPrimaryValue),
    600: Color(0xFFB6860A),
    700: Color(0xFFB6860A),
    800: Color(0xFFB6860A),
    900: Color(0xFFB6860A),
  },
);
const int _yellowPrimaryValue = 0xFFB6860A;
