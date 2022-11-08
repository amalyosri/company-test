// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

var lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: HexColor("#F5FCFF"),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleSpacing: 20,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black,
      ),
      // backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      elevation: 20,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.3)));
