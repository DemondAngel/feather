import 'package:feater_flutter_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppBarType{
  TRANSPARENT,
  MODULE,
  SEARCH,
  SHOP
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

AppBar customAppBarModule({required BuildContext context, required bool showReturnButton, VoidCallback? returnButtonAction, required title}){
  final leadingButton = TextButton(
    onPressed: returnButtonAction ?? () => Navigator.of(context).pop(),
    child: SvgPicture.asset(backButtonIcon),
  );

  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0.0,
    toolbarHeight: 60,
    title: Text(title,
      style: Theme.of(context).textTheme.headline6
    ),
    leading: leadingButton,
  );
}

AppBar customAppBarShop({required BuildContext context, required bool showReturnButton, VoidCallback? returnButtonAction, required title}){
  final leadingButton = TextButton(
    onPressed: returnButtonAction ?? () => Navigator.of(context).pop(),
    child: SvgPicture.asset(backButtonIcon),
  );

  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0.0,
    toolbarHeight: 60,
    title: Text(title,
        style: Theme.of(context).textTheme.headline6
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pushNamed('/cart'),
        child: Icon(
            Icons.shopping_cart,
          color: Colors.white,
          size: 28,
        ),
      )
    ],
    leading: leadingButton,
  );
}