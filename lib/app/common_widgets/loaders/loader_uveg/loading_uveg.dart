import 'package:flutter/material.dart';

import '../painters/arcs_painters.dart';

class LoadingUveg extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final String urlImageCenter;

  const LoadingUveg({
    Key? key,
    this.color1 = const Color.fromARGB(255, 4, 87, 155),
    this.color2 = const Color.fromARGB(255, 3, 96, 172),
    this.color3 = const Color.fromARGB(255, 33, 150, 243),
    this.urlImageCenter = 'assets/logo.png',
  }) : super(key: key);

  @override
  State<LoadingUveg> createState() => _LoadingUvegState();
}

class _LoadingUvegState extends State<LoadingUveg>
    with TickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    controller2 = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    controller3 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller1,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    animation2 = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller2,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller3,
        curve: const Interval(0.0, 1.0, curve: Curves.decelerate),
      ),
    );

    controller1.repeat();
    controller2.repeat();
    controller3.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.urlImageCenter),
            ),
          ),
        ),
        RotationTransition(
          turns: animation1,
          child: CustomPaint(
            painter: Arc1Painter(widget.color1),
            child: const SizedBox(
              width: 120.0,
              height: 120.0,
            ),
          ),
        ),
        RotationTransition(
          turns: animation2,
          child: CustomPaint(
            painter: Arc2Painter(widget.color2),
            child: const SizedBox(
              width: 120.0,
              height: 120.0,
            ),
          ),
        ),
        RotationTransition(
          turns: animation3,
          child: CustomPaint(
            painter: Arc3Painter(widget.color3),
            child: const SizedBox(
              width: 120.0,
              height: 120.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
}
