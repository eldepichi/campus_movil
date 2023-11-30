import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final int random;

  const Background({
    Key? key,
    required this.child,
    required this.random,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BackgoundDynamic(random),
          const _HeaderLogo(
            'assets/hazclic_logomovil.png',
            'assets/logo_b.png',
          ),
          child,
          /*const SafeArea(
            child: Text(
              'No tienes conexión a internet.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),*/
        ],
      ),
    );
  }
}

class _HeaderLogo extends StatelessWidget {
  final String urlPublicity;
  final String urlLogo;

  const _HeaderLogo(this.urlPublicity, this.urlLogo);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: size.width,
          height: size.height * .7,
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                urlPublicity,
                height: size.height * .15,
                width: size.width * .5,
              ),
              Image.asset(
                urlLogo,
                height: size.height * .15,
                width: size.width * .5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgoundDynamic extends StatelessWidget {
  final int random;
  const _BackgoundDynamic(this.random);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back_movil$random.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
