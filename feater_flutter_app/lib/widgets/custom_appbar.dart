import 'package:feater_flutter_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppBarType{
  TRANSPARENT,
  MODULE,
  SEARCH
}


AppBar customAppBarTransparent({required BuildContext context, String? textTitle, required bool showReturnButton,
  VoidCallback? returnButtonAction}){

  final leadingButton = TextButton(
    onPressed: returnButtonAction ?? () => Navigator.of(context).pop(),
    child: SvgPicture.asset(backButtonIcon),
  );

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 60,
    leading: leadingButton,
  );
}

AppBar customAppBarSearch({required BuildContext context, required bool showReturnButton, VoidCallback? returnButtonAction}){

  final leadingButton = TextButton(
    onPressed: returnButtonAction ?? () => Navigator.of(context).pop(),
    child: SvgPicture.asset(backButtonIcon),
  );

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 90,
    leading: showReturnButton ? leadingButton : Container(),
    actions: [
      Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextButton(
          onPressed: () {  },
          child: SvgPicture.asset(searchIcon)
        )
      ),
      SizedBox(
        width: 20
      ),
      Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(
              top: 20,
              bottom: 20
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: TextButton(
              onPressed: () {  },
              child: SvgPicture.asset(filterIcon)
          )
      ),
      SizedBox(
          width: 20
      ),
    ],
  );
}