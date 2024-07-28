import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant.dart';

class Themes {
  static ThemeData defaultTheme() => ThemeData(
        primaryColor: kPrimaryColor,
        useMaterial3: true,
        disabledColor: const Color.fromRGBO(185, 185, 185, 1),
        fontFamily: FontFamilies.quicksand,
        datePickerTheme: _datePickerTheme(),
        textTheme: _textTheme(),
        tabBarTheme: _tabBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        popupMenuTheme: _popUpMenuThemeData(),
        cupertinoOverrideTheme: _cupertinoOverrideTheme(),
        textSelectionTheme: _textSelectionTheme(),
        textButtonTheme: _textButtonTheme(),
        scrollbarTheme: _scrollbarTheme(),
        checkboxTheme: _checkBoxThemeData(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
        expansionTileTheme: _expansionTileThemeData(),
      );

  static AppBarTheme _appBarTheme() => const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        actionsIconTheme: IconThemeData(
          color: kNeutralColor,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: kPrimaryColor,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      );

  static TextTheme _textTheme() => const TextTheme(
        displayLarge: TextStyle(
            height: 1.0,
            fontSize: 96,
            color: Colors.white,
            letterSpacing: -1.5,
            fontFamily: FontFamilies.quicksand,
            fontWeight: FontWeight.normal),
        displayMedium: TextStyle(
          height: 1.2,
          fontSize: 60,
          color: Colors.black,
          letterSpacing: -0.5,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.normal,
        ),
        displaySmall: TextStyle(
          height: 1.2,
          fontSize: 48,
          letterSpacing: 0,
          color: Colors.black,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: TextStyle(
          height: 1.2,
          fontSize: 34,
          letterSpacing: 0.25,
          color: Colors.black,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.normal,
        ),
        headlineSmall: TextStyle(
          height: 1.2,
          fontSize: 24,
          letterSpacing: 0,
          color: Colors.black,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
          height: 1.2,
          fontSize: 20,
          letterSpacing: 0.15,
          color: Colors.black,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          letterSpacing: 0.15,
          color: Color(0xFF323643),
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          letterSpacing: 0.1,
          color: Color(0xFF323643),
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: Color(0xFF323643),
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          letterSpacing: 0.25,
          color: Color(0xFF20262E),
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          letterSpacing: 1.25,
          color: Colors.white,
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          letterSpacing: 0.4,
          color: Colors.grey,
          fontFamily: FontFamilies.quicksand,
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
      );

  static TabBarTheme _tabBarTheme() => TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(
          fontFamily: FontFamilies.quicksand,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: FontFamilies.quicksand,
          color: Colors.grey[500],
          fontWeight: FontWeight.w600,
        ),
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kPrimaryColor, width: 4),
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontFamily: FontFamilies.quicksand,
        ),
        border: OutlineInputBorder(
          // borderSide: const BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
          fontFamily: FontFamilies.quicksand,
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      );

  static CupertinoThemeData _cupertinoOverrideTheme() =>
      const CupertinoThemeData(
        primaryColor: kPrimaryColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: kPrimaryColor,
          actionTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  static ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(
          Colors.white70,
        ),
      );

  static DatePickerThemeData _datePickerTheme() => const DatePickerThemeData();

  static PopupMenuThemeData _popUpMenuThemeData() => PopupMenuThemeData(
        elevation: 15,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: FontFamilies.quicksand,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey[300]!,
            width: 2,
          ),
        ),
      );

  static TextSelectionThemeData _textSelectionTheme() => TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionHandleColor: kPrimaryColor,
        selectionColor: kPrimaryColor.withOpacity(.1),
      );

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: kPrimaryColor,
          textStyle: _textTheme().labelLarge,
          minimumSize: const Size(
            double.infinity, //sizeConfig.width(.85),
            55, //sizeConfig.height(.06),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          animationDuration: const Duration(milliseconds: 250),
        ),
      );

  static CheckboxThemeData _checkBoxThemeData() => CheckboxThemeData(
        side: const BorderSide(width: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          textStyle: _textTheme().labelLarge,
          minimumSize: const Size(
            double.infinity, //sizeConfig.width(.85),
            55, //sizeConfig.height(.06),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          animationDuration: const Duration(milliseconds: 250),
          side: const BorderSide(width: 2.0, color: kPrimaryColor),
        ),
      );

  static ExpansionTileThemeData _expansionTileThemeData() =>
      const ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
      );
}

class FontFamilies {
  static const String quicksand = 'Quicksand';
}
