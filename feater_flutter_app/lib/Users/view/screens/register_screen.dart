import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen>{
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        appBarType: AppBarType.MODULE,
        textTitle: 'Registro - Obio',
        showReturnButton: true,
        body: Container(

        )
    );
  }

}