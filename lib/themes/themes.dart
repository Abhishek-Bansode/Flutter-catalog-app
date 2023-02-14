import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/themes/app_color.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: AppColor.creamColor,

        buttonTheme: ButtonThemeData(
          buttonColor: AppColor.darkBluishColor,
        ),

        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.darkBluishColor),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'poppins()',
            fontSize: 20,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        // brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: AppColor.darkCreamColor,

        buttonTheme: ButtonThemeData(
          buttonColor: AppColor.lightBluishColor,
        ),
      
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins()',
            fontSize: 20,
          ),
        ),
      );

}
