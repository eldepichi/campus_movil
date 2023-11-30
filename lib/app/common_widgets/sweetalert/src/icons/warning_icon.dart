import 'package:flutter/material.dart';

import 'circle_paint.dart';
import 'warning_paint.dart';

class WarningIcon extends StatefulWidget {
  final double size;

  const WarningIcon({
    Key? key,
    this.size = 80.0,
  }) : super(key: key);

  @override
  State<WarningIcon> createState() => _WarningIconState();
}

class _WarningIconState extends State<WarningIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _iconAnimation =
        Tween<double>(begin: 2, end: 1).animate(_iconAnimationController)
          ..addListener(
            () {
              setState(() {});
            },
          );

    _iconAnimationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        foregroundPainter: CirclePaint(
          rate: 100,
          strokeWidth: 3.0,
          fillColor: const Color.fromRGBO(250, 206, 168, 0.8),
          color: const Color.fromRGBO(135, 173, 189, 0),
        ),
        child: ScaleTransition(
          scale: _iconAnimation,
          child: const WarningShape(
            color: Color.fromRGBO(250, 206, 168, 1),
          ),
        ),
      ),
    );
  }
}
