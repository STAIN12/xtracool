import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/text_styles.dart';

class MyThemeData {
  static final lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
    scaffoldBackgroundColor: kWhiteColor,
    colorScheme: const ColorScheme.light(),
    fontFamily: "Poppins",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: kPrimaryColor,
      selectedLabelStyle: kTextStyleSize8,
      unselectedLabelStyle: kTextStyleSize8,
      selectedIconTheme: IconThemeData(size: 25.0),
      unselectedIconTheme: IconThemeData(size: 25),
    ),
  );

  static final darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: kBlackColor,
    fontFamily: "Poppins",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimaryColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      
      selectedItemColor: kYellowPrimaryColor,
      unselectedItemColor: kGreyColor,
      selectedLabelStyle: kTextStyleSize12,
      unselectedLabelStyle: kTextStyleSize12,
      selectedIconTheme: IconThemeData(size: 25.0),
      unselectedIconTheme: IconThemeData(size: 25),
    ),
  );
}
