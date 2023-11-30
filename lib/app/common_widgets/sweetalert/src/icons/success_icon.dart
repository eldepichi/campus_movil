import 'dart:async';

import 'package:flutter/material.dart';

import 'circle_paint.dart';

class SuccessIcon extends StatefulWidget {
  final double size;

  const SuccessIcon({
    Key? key,
    this.size = 80.0,
  }) : super(key: key);

  @override
  State<SuccessIcon> createState() => _SuccessIconState();
}

class _SuccessIconState extends State<SuccessIcon>
    with TickerProviderStateMixin {
  late AnimationController _circleAnimationController;
  late Animation<double> _circleAnimation;

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  late Timer _forwardTimer;

  @override
  void initState() {
    _circleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _circleAnimation =
        Tween<double>(begin: 0, end: 100.0).animate(_circleAnimationController)
          ..addListener(
            () {
              setState(() {});
              if (_circleAnimationController.isCompleted) {
                _iconAnimationController.forward();
              }
            },
          );

    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _iconAnimation =
        Tween<double>(begin: (widget.size - 30), end: (widget.size - 20))
            .animate(_iconAnimationController)
          ..addListener(
            () {
              setState(() {});
            },
          );

    _forwardTimer = Timer(
      const Duration(milliseconds: 500),
      () {
        _circleAnimationController.forward();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _circleAnimationController.dispose();
    _iconAnimationController.dispose();
    _forwardTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        foregroundPainter: CirclePaint(
          rate: _circleAnimation.value,
          strokeWidth: 3.0,
          fillColor: const Color.fromRGBO(165, 220, 134, 0.3),
          color: const Color.fromRGBO(165, 220, 134, 1.0),
        ),
        child: Icon(
          Icons.check,
          size: _iconAnimation.value,
          color: _iconAnimation.isCompleted
              ? const Color.fromRGBO(165, 220, 134, 1.0)
              : const Color.fromRGBO(165, 220, 134, 0.3),
        ),
      ),
    );
  }
}
