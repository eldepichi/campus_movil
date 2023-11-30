import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/delete_cache_images.dart';

class PerfilAlumno extends StatelessWidget {
  const PerfilAlumno({
    Key? key,
    this.urlImage = 'assets/splash_screen.gif',
    required this.photo,
  }) : super(key: key);

  final String urlImage;
  final String photo;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    Widget hijo1, hijo2, hijo3;

    if (orientation == Orientation.portrait) {
      hijo1 = Container(
        width: size.width,
        height: size.height * .3,
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      );

      hijo2 = SizedBox(
        width: size.width * .6,
        height: size.height * .3,
        child: Image.asset(urlImage),
      );

      hijo3 = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AvatarCircular2(
            url: photo,
            saveCache: true,
          ),
          Container(),
        ],
      );
    } else {
      hijo1 = Container(
        width: size.width,
        height: size.height * .3,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back_movil_horizontal7.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      );
      hijo2 = const SizedBox();
      hijo3 = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AvatarCircular2(
            url: photo,
          ),
        ],
      );
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        hijo1,
        Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            hijo3,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [hijo2],
            ),
          ],
        ),
      ],
    );
  }
}

class AvatarCircular2 extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final Color color;
  final BorderRadius? borderRadius;
  final bool saveCache;
  final BoxFit? fit;

  const AvatarCircular2({
    Key? key,
    required this.url,
    this.height = 150,
    this.width = 150,
    this.saveCache = true,
    this.color = Colors.blue,
    this.borderRadius,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: LoadImageAnimated(
          urlImage: url,
          saveCache: saveCache,
          fit: fit,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------
class LoadImageAnimated extends StatefulWidget {
  final String? urlImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;
  final bool saveCache;
  final ColorFilter? colorFilter;

  const LoadImageAnimated({
    Key? key,
    required this.urlImage,
    this.saveCache = true,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    this.fit = BoxFit.cover,
    this.colorFilter = const ColorFilter.mode(
      Colors.transparent,
      BlendMode.color,
    ),
  }) : super(key: key);

  @override
  State<LoadImageAnimated> createState() => _LoadImageAnimatedState();
}

class _LoadImageAnimatedState extends State<LoadImageAnimated> {
  @override
  void dispose() {
    if (!widget.saveCache) {
      deleteImageFromCache(widget.urlImage);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String cadenaPrincipal = '${widget.urlImage}';

    // Encuentra la cadena que deseas reemplazar
    String cadenaAReemplazar = '.png';

    // Define la nueva cadena con la que deseas reemplazar
    String nuevaCadena = '.webp';
    String resultado;
    if (cadenaPrincipal.contains(nuevaCadena)) {
      resultado = cadenaPrincipal;
    } else {
      // Utiliza el método replaceAll para reemplazar todas las instancias de la cadena
      resultado = cadenaPrincipal.replaceAll(cadenaAReemplazar, nuevaCadena);
    }

    return ClipRRect(
      borderRadius: widget.borderRadius!,
      child: SizedBox(
        width: size.width,
        child: (widget.urlImage != null)
            ? ColorFiltered(
                colorFilter: widget.colorFilter!,
                child: CachedNetworkImage(
                  imageUrl: resultado,
                  placeholder: (context, url) => Image.asset(
                    'assets/giphy.gif',
                    fit: widget.fit,
                  ),
                  fit: widget.fit,
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage('assets/no-image.png'),
                  ),
                ),
              )
            : const Image(
                image: AssetImage('assets/no-image.png'),
              ),
      ),
    );
  }
}
// ------------------------------------------------------------------------------------------------
