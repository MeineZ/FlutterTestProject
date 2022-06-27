import 'package:flutter/material.dart';
import 'package:kla_prototype/utils/constants.dart';
import './custom_button.dart';

class YellowButton extends StatelessWidget {
  final String text;
  final String? image;
  final IconData? icon;

  final BoxBorder? border;

  final void Function() onPressed;

  final bool centeredContent;
  final double topBorderRadius;

  const YellowButton(
    this.text, {
    required this.onPressed,
    this.image,
    this.icon,
    this.centeredContent = false,
    this.border,
    this.topBorderRadius = 5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text,
      image: image,
      icon: icon,
      onPressed: onPressed,
      backgroundColor: c_Yellow,
      elevationColor: c_YellowDark300,
      textColor: c_YellowDark,
      centeredContent: centeredContent,
      border: border,
      topBorderRadius: topBorderRadius,
    );
  }
}
