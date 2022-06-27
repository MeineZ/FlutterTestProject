import 'package:flutter/material.dart';
import 'package:kla_prototype/utils/constants.dart';
import './custom_button.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final String? image;
  final IconData? icon;

  final BoxBorder? border;

  final void Function() onPressed;

  const BlueButton(
    this.text, {
    required this.onPressed,
    this.image,
    this.icon,
    this.border,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text,
      image: image,
      icon: icon,
      onPressed: onPressed,
      backgroundColor: c_Blue,
      elevationColor: c_BlueDark,
      textColor: Colors.white,
      border: border,
    );
  }
}
