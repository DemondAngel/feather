import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



ThemeData customTheme(){

  const primaryColor = Color(0xFFD0973C);
  const accentColor = Color(0xFFFCAF1A);
  const fontFamily = 'Heading primary Poppins 50 SemiBold';

  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: primaryColor,
    fontFamily: fontFamily,
    primaryColor: primaryColor,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: accentColor,
      brightness: Brightness.light,
      elevation: 3,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1
        )
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black,
              width: 1
          )
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black,
              width: 2
          )
      ),
      labelStyle: TextStyle(
        color:Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(accentColor),
        elevation: MaterialStateProperty.all<double>(0),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          )
        ),
        alignment: Alignment.center,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ))
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(style: BorderStyle.none)
      ),
    ),
    //cardColor: materialColorBlack[100],
    iconTheme: IconThemeData(
      color: accentColor
    ),
    textTheme: TextTheme(
      headline6: TextStyle( //Este es para appBar 
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: Colors.white
      ),
      headline5: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: accentColor,
        fontSize: 24,
      ),
      subtitle2: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: accentColor,
        fontSize: 20
      ),
      bodyText1: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: accentColor,
        fontSize: 17
      ),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 15
      ),
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(accentColor)
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(primaryColor),

    ),
    dialogTheme: DialogTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: accentColor,
        fontSize: 24,
      ),
      contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          color: accentColor,
          fontSize: 17
      ),
    ),
    indicatorColor: accentColor
  );
}


