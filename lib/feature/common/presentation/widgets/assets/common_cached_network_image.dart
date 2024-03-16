import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_treasures/core/config/api_config.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';

class CommonCachedNetworkImage extends StatelessWidget {
  const CommonCachedNetworkImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.errorWidget = const Icon(Icons.error),
    this.placeHolder = const CircularProgressIndicator(
      color: ColorsResource.primary,
      strokeWidth: 2,
    ),
    this.fit,
  });

  final String imagePath;
  final double? height, width;
  final Widget errorWidget, placeHolder;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final url =  imagePath;

    if (url.contains('.svg')) {
      return SvgPicture.network(
        url,
        placeholderBuilder: (context) => errorWidget,
      );
    }
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) => placeHolder,
      errorWidget: (context, url, error) => errorWidget,
    );
  }
}
