import 'package:flutter/material.dart';
import 'package:uidesign_home/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets ?padding;
  final double width, height;
  const BorderBox(
      {Key? key,
      required this.child,
      this.padding,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
      ),
      padding: padding ?? EdgeInsets.all(8),
      child: Center(
        child: child,
      ),
    );
  }
}
