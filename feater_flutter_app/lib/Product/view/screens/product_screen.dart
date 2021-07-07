import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProductScreenState();

}

class _ProductScreenState extends State<ProductScreen>{
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        appBarType: AppBarType.MODULE,
        showReturnButton: true,
        body: SingleChildScrollView(
         child: Column(
          
           children: [],
         ),
        )
    );
  }

}