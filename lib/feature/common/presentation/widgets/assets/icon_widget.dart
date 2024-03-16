import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final List? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;
  const IconWidget({
    super.key,
    this.color,
    this.icon,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
    );
  }
}
