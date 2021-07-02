import 'package:flutter/material.dart';

enum SnackBarStyle { ALERT, WARNING, SUCCESS, INFO }

showCustomSnackBar(context, text, SnackBarStyle snackbarStyle){
  final snackBar = SnackBar(
    backgroundColor: snackbarStyle == SnackBarStyle.ALERT
        ? Colors.red
        : snackbarStyle == SnackBarStyle.INFO
        ? Theme.of(context).primaryColor
        : snackbarStyle == SnackBarStyle.SUCCESS
        ? Colors.green
        : Colors.amber,
    content: Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white
      )),
      duration: Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
