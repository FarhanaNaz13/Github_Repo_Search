import 'package:flutter/material.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';
import 'package:github_treasures/core/resource/style/common_style.dart';
import 'package:github_treasures/core/resource/typography.dart';
import 'package:github_treasures/feature/common/presentation/widgets/common_text_widget.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color color;
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = ColorsResource.colorDeepBlue,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      color: color,
      onPressed: onPressed,
      disabledColor: ColorsResource.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: CommonStyle.borderRadiusOfFour,
        side: BorderSide(color: color),
      ),
      child: CommonTextWidget(
        text: label,
        textAlign: TextAlign.justify,
        style: TypographyResource.textStyleF14W400,
      ),
    );
  }
}
