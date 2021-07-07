import 'package:feater_flutter_app/Product/view/screens/products_screen.dart';
import 'package:feater_flutter_app/Users/view/screens/login_screen.dart';
import 'package:feater_flutter_app/Users/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => LoginScreen(),
  '/user/register':(context) => RegisterScreen(),
  '/products': (context) => ProductsScreen()
};