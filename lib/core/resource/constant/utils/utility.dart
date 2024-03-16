import 'package:flutter/material.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';
//
// class Utility {
   Color getLanguageColor(String? language) {
    switch (language) {
      case 'Dart':
        return ColorsResource.colorTeal;
      case 'C++':
        return ColorsResource.colorHotPink;
      case 'HTML':
        return ColorsResource.colorVermilion;
      case 'JavaScript':
        return ColorsResource.colorGoldenrod;
      case 'C':
        return ColorsResource.colorDimGray;
      case 'Java':
        return ColorsResource.colorRusset;
      case 'Makefile':
        return ColorsResource.colorDarkLimeGreen;
      case 'Go':
        return ColorsResource.colorVividBlue;
      case 'Kotlin':
        return ColorsResource.colorLavender;
      case 'Objective-C':
        return ColorsResource.colorBrilliantBlue;
      case 'PHP':
        return ColorsResource.colorIndigo;
      case 'Shell':
        return ColorsResource.colorLimeGreen;
      case 'Objective-C++':
        return ColorsResource.colorCornflowerBlue;
      case 'Swift':
        return ColorsResource.colorCoral;
      case 'Python':
        return ColorsResource.colorSteelBlue;
      case 'Ruby':
        return ColorsResource.colorMaroon;
      case 'Rust':
        return ColorsResource.colorDesertSand;
      case 'TypeScript':
        return ColorsResource.colorCeruleanBlue;
      case 'Dockerfile':
        return ColorsResource.colorTealBlue;
      case 'Svelte':
        return ColorsResource.colorOrangeRed;
      case 'ASP.NET':
        return ColorsResource.colorElectricViolet;
      case 'C#':
        return ColorsResource.colorForestGreen;
      case 'CSS':
        return ColorsResource.colorDeepPurple;
      case 'Elm':
        return ColorsResource.colorSkyBlue;
      case 'Sass':
        return ColorsResource.colorDarkMagenta;
      case 'R':
        return ColorsResource.colorDodgerBlue;
      default:
        return ColorsResource.primary;
    }
  }
// }
