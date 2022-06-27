import 'package:flutter/material.dart';

BorderRadius horizontalBorderRadius({double top = 0, double bottom = 0}) =>
    BorderRadius.only(
      topLeft: Radius.circular(top),
      topRight: Radius.circular(top),
      bottomLeft: Radius.circular(bottom),
      bottomRight: Radius.circular(bottom),
    );

BorderRadius verticalBorderRadius({double left = 0, double right = 0}) =>
    BorderRadius.only(
      topLeft: Radius.circular(left),
      topRight: Radius.circular(right),
      bottomLeft: Radius.circular(left),
      bottomRight: Radius.circular(right),
    );

BorderRadius diagonalBorderRadius({double tlbr = 0, double bltr = 0}) =>
    BorderRadius.only(
      topLeft: Radius.circular(tlbr),
      topRight: Radius.circular(bltr),
      bottomLeft: Radius.circular(bltr),
      bottomRight: Radius.circular(tlbr),
    );
