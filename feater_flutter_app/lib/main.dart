import 'package:feater_flutter_app/Delivery/bloc/delivery_bloc.dart';
import 'package:feater_flutter_app/Users/bloc/user_bloc.dart';
import 'package:feater_flutter_app/utils/routing.dart';
import 'package:feater_flutter_app/widgets/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: BlocProvider(
        bloc: DeliveryBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes,
          theme: customTheme(),
          initialRoute: '/',
        ),
      )
    );
  }
}
