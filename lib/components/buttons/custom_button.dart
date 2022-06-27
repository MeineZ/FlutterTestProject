import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:kla_prototype/utils/constants.dart';
import 'package:kla_prototype/utils/radius.dart';
import 'package:kla_prototype/utils/spaces.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final String? image;
  final IconData? icon;

  final Color backgroundColor;
  final Color elevationColor;
  final Color textColor;
  final BoxBorder? border;

  final void Function() onPressed;

  final bool centeredContent;
  final double topBorderRadius;

  const CustomButton(
    this.text, {
    required this.onPressed,
    required this.backgroundColor,
    required this.elevationColor,
    required this.textColor,
    this.border,
    this.image,
    this.icon,
    this.centeredContent = false,
    this.topBorderRadius = 5,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with 
  SingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<double> paddingAnimation;

  late BorderRadiusGeometry? borderRadiusGeometry;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    paddingAnimation = Tween<double>(begin: 5.0, end: 0.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    borderRadiusGeometry = horizontalBorderRadius(top: widget.topBorderRadius, bottom: 5);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
          top: 5 - paddingAnimation.value, bottom: paddingAnimation.value),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadiusGeometry,
          boxShadow: [
            BoxShadow(
                color: widget.elevationColor,
                spreadRadius: 0,
                blurRadius: 0,
                blurStyle: BlurStyle.solid,
                offset: Offset(0, paddingAnimation.value))
          ],
        ),
        child: GestureDetector(
          onTapDown: (TapDownDetails _) => animationController.forward(),
          onTap: widget.onPressed,
          onTapCancel: () => animationController.reverse(),
          onTapUp: (TapUpDetails _) => animationController.reverse(),
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: borderRadiusGeometry,
              border: widget.border
            ),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: _getContentAlignment(),
                    children: [
                      if (widget.image != null) ...[
                        Image.asset("assets/${widget.image}")
                      ],
                      if (widget.icon != null) ...[Icon(widget.icon, size: 32, color: widget.textColor,)],
                      if (widget.image != null || widget.icon != null) ...[
                        addHorizontalSpace(10)
                      ],
                      Flexible(
                        child: Container(
                          child: Text(
                            widget.text,
                            overflow: TextOverflow.fade,
                            style: themeData.textTheme.headline5!
                                .apply(fontWeightDelta: 3, color: widget.textColor),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  MainAxisAlignment _getContentAlignment() {
    if (widget.centeredContent) {
      return MainAxisAlignment.center;
    }
    return MainAxisAlignment.start;
  }
}
