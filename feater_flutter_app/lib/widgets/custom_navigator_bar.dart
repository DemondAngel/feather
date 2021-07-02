import 'package:feater_flutter_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigatorBar extends StatelessWidget {

  final Function(int) onChange;
  final int currentIndex;

  const CustomNavigatorBar({Key? key, required this.onChange, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //Aquí lo puedo manejar con una lista y un builder
        children: [
          CustomItemNavigator(
            svg: menuIcon,
            onPressed: () => onChange(0),
            isActive: currentIndex == 0,
          ),
          CustomItemNavigator(
            svg: calendarIcon ,
            onPressed: () => onChange(1),
            isActive: currentIndex == 1,
          ),
          CustomItemNavigator(
            svg: starIcon,
            onPressed: () => onChange(2),
            isActive: currentIndex == 2,
          ),
          CustomItemNavigator(
            svg: userIcon,
            onPressed: () => onChange(3),
            isActive: currentIndex == 3,
          ),
        ],
      ),
    );
  }
}

class CustomItemNavigator extends StatelessWidget {

  final String svg;
  final bool? isActive;
  final VoidCallback? onPressed;

  const CustomItemNavigator({Key? key, required this.svg, this.onPressed, this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.circle,
      child: IconButton(
        splashColor: Colors.white,
        color: Color(0xFF333333),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(svg, fit: BoxFit.cover, color: isActive! ? Theme.of(context).primaryColor : Color(0xFF60656C)),
        splashRadius: 24,
      ),
    );
  }
}