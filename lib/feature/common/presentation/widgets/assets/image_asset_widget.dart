import 'package:flutter/material.dart';

class ImageAssetWidget extends StatelessWidget {
  final String assetPath;
  final double height;
  final double width;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  const ImageAssetWidget({
    super.key,
    required this.assetPath,
    required this.height,
    required this.width,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      height: height,
      width: width,
      errorBuilder: errorBuilder,
    );
  }
}
