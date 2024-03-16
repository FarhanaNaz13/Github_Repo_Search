import 'package:flutter/material.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';

abstract class MyLightTheme {
  static const colorScheme = ColorScheme.light(
    primary: ColorsResource.primary,
    secondary: ColorsResource.secondary,
    background: ColorsResource.whiteColor,
  );
  static Color textColor = ColorsResource.inputTextColor;
}
