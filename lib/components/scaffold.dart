import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Image.asset(
                  "assets/bg_green.png",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
              body
            ]);
          },
        ),
      ),
    );

    //   body: SafeArea(
    //     child: LayoutBuilder(builder: (context, constraints) {
    //     return Stack(children: [
    //       Container(
    //           width: constraints.maxWidth,
    //           height: constraints.maxHeight,
    //           child: Image.asset(
    //             "assets/bg_green.png",
    //             alignment: Alignment.topCenter,
    //             fit: BoxFit.cover,
    //           ),),
    //   );
    // ),
  }
}
