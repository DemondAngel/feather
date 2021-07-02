import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



ThemeData customTheme(){

  const colorGreen = Color(0xFF29A35C);
  const colorWhite = Color(0xFFF7F7F7);
  const fontFamily = 'Raleway';

  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: colorGreen,
    fontFamily: fontFamily,
    primaryColor: colorGreen,
    accentColor: colorWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: colorGreen,
      foregroundColor: colorWhite,
      brightness: Brightness.light,
      elevation: 3,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFF808080)
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: EdgeInsets.fromLTRB(15, 14, 15, 14),
      alignLabelWithHint: true,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: Color(0xFF808080),
        fontSize: 15,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
            width: 1,
            color: Color(0xFFE5E5E5)
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
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
      color: colorWhite
    ),
    textTheme: TextTheme(
      headline6: TextStyle( //Este es para appBar 
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: colorWhite,
      ),
      headline5: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: colorWhite,
        fontSize: 24,
      ),
      subtitle2: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: colorWhite,
        fontSize: 20
      ),
      bodyText1: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: colorWhite,
        fontSize: 17
      ),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        color: colorWhite,
        fontSize: 15
      ),
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorWhite)
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(colorGreen),

    ),
    dialogTheme: DialogTheme(
      backgroundColor: colorGreen,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: colorWhite,
        fontSize: 24,
      ),
      contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          color: colorWhite,
          fontSize: 17
      ),
    ),
    indicatorColor: colorWhite
  );
}


