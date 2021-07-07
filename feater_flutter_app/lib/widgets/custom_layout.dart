import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatefulWidget{

  final AppBarType appBarType;
  final bool showReturnButton;
  final VoidCallback? returnButtonAction;
  final Widget body;
  final String textTitle;
  final CustomNavigatorBar? bottomNavigationBar;

  const CustomLayout({Key? key, required this.appBarType, required this.showReturnButton, this.returnButtonAction, this.textTitle = "", required this.body, this.bottomNavigationBar}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomLayoutState();

}

class _CustomLayoutState extends State<CustomLayout>{
  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
    child: SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: this.widget.appBarType == AppBarType.TRANSPARENT || this.widget.appBarType == AppBarType.SEARCH,
          appBar: this.widget.appBarType == AppBarType.TRANSPARENT ? customAppBarTransparent(
            context: context,
            textTitle: this.widget.textTitle,
            showReturnButton: this.widget.showReturnButton,
            returnButtonAction: this.widget.returnButtonAction
          ): this.widget.appBarType == AppBarType.SEARCH ? customAppBarSearch(
              context: context,
              showReturnButton: this.widget.showReturnButton,
              returnButtonAction: this.widget.returnButtonAction,
          ): this.widget.appBarType == AppBarType.MODULE ? customAppBarModule(
            title: 'Obio',
              context: context,
              showReturnButton: this.widget.showReturnButton,
              returnButtonAction: this.widget.returnButtonAction
          ): customAppBarShop(context: context, showReturnButton:this.widget.showReturnButton, title: 'Obio', returnButtonAction: this.widget.returnButtonAction),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    /*decoration: this.widget.appBarType == AppBarType.TRANSPARENT ? BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(background),
                            fit: BoxFit.cover,
                            alignment: Alignment.center
                        )
                    ): null,*/
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: this.widget.body,
                  )
                );
              },
            )
          ),
          bottomNavigationBar: this.widget.bottomNavigationBar

        ),
      ),
    ),
  );

}