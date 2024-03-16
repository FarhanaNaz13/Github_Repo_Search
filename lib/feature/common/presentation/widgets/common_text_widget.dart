import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final TextAlign? textAlign;
  const CommonTextWidget({
    super.key,
    required this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textScaleFactor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      textAlign: textAlign,
    );
  }
}
