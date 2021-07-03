import 'package:feater_flutter_app/utils/routing.dart';
import 'package:feater_flutter_app/widgets/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: customTheme(),
      initialRoute: '/',
    );
  }
}
