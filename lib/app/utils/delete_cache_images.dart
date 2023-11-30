import 'package:cached_network_image/cached_network_image.dart';

Future deleteImageFromCache(String? urlImage) async {
  String url = '$urlImage';
  await CachedNetworkImage.evictFromCache(url);
}
