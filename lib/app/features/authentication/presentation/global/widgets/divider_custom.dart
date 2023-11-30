import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final bool? isVertical;
  const DividerCustom({
    Key? key,
    this.color,
    this.height,
    this.width,
    this.isVertical = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget container = isVertical!
        ? Container(
            color: color,
            height: height,
            width: width,
          )
        : Container(
            color: color,
            width: height,
            height: width,
          );

    return container;
  }
}
