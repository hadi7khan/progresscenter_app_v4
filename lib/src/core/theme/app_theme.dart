import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

import 'theme_const.dart';

mixin AppThemeMixin {
  static const MaterialColor primarySwatch = MaterialColor(
    0xff6366F1,
    <int, Color>{
      50: Color.fromRGBO(99, 102, 241, 1), //10%
      100: Color.fromRGBO(99, 102, 241, 0.9), //20%
      200: Color.fromRGBO(99, 102, 241, 0.8), //30%
      300: Color.fromRGBO(99, 102, 241, 0.7), //40%
      400: Color.fromRGBO(99, 102, 241, 0.6), //50%
      500: Color.fromRGBO(99, 102, 241, 0.5), //60%
      600: Color.fromRGBO(99, 102, 241, 0.4), //70%
      700: Color.fromRGBO(99, 102, 241, 0.3), //80%
      800: Color.fromRGBO(99, 102, 241, 0.2), //90%
      900: Color.fromRGBO(99, 102, 241, 0.1), //100%
    },
  );

  final lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: Color(0xFFF7F7F7),
    fontFamily: 'Inter',
    useMaterial3: true,
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: TextStyle(color: Helper.secondary),
        backgroundColor: Colors.transparent,
        elevation: 0),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Helper.primary),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.grey.shade400),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Helper.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffEB2727)),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      selectedIconTheme: IconThemeData(
        color: Helper.primary,
      ),
      selectedLabelTextStyle: TextStyle(
        color: Helper.primary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Helper.primary,
      unselectedItemColor: Helper.secondary,
      selectedLabelStyle: TextStyle(
        color: Helper.primary,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        color: Helper.secondary,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: Colors.white,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          labelLarge: const TextStyle(
            fontSize: 24,
            letterSpacing: 10,
            color: Colors.black,
          ),
        ),
  );

  final darkTheme = ThemeData(
    primarySwatch: primarySwatch,
    brightness: Brightness.dark,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Helper.primary),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black38,
      selectedItemColor: Helper.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        color: Helper.primary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  ThemeMode currentTheme(String theme) {
    switch (theme) {
      case "":
        return ThemeMode.light;
      case kLight:
        return ThemeMode.light;
      case kDark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
