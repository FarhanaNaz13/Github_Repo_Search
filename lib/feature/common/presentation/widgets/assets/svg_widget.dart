import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  final String assetName;
  final double? height;
  final double? width;
  final Alignment alignment;
  const SvgWidget({
    super.key,
    required this.assetName,
    this.height,
    this.width,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      alignment: alignment,
    );
  }
}
