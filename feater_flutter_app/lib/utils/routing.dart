import 'package:feater_flutter_app/Users/view/screens/login_screen.dart';
import 'package:feater_flutter_app/Users/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => LoginScreen(),
  '/user/register':(context) => RegisterScreen(),
  //'/home': (context) => HomeScreen()*/
};