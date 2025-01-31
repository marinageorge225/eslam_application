import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  static ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColours.whiteColour,
      unselectedItemColor: AppColours.blackColour,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColours.blackColour,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColours.primaryDark
      )
    )
  );

}