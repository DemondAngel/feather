import 'package:feater_flutter_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtons extends StatelessWidget{

  final VoidCallback? onPressed;
  final SvgPicture iconSVG;
  final Color color;

  const SocialButtons({Key? key, this.onPressed, required this.iconSVG, required this.color}) : super(key: key);

  factory SocialButtons.facebook({VoidCallback? onPressed}) => SocialButtons(
      iconSVG: SvgPicture.asset(facebookIcon),
      onPressed: onPressed,
    color: Color(0xFF4064AC),
  );

  factory SocialButtons.google({VoidCallback? onPressed}) => SocialButtons(
      iconSVG: SvgPicture.asset(googleIcons),
      onPressed: onPressed,
      color: Colors.white,
  );

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onPressed, child: iconSVG,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(this.color)
    ),
  );
}