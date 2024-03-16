import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';
import 'package:github_treasures/core/resource/dimension_const.dart';
import 'package:github_treasures/core/resource/typography.dart';
import 'package:github_treasures/feature/common/presentation/widgets/assets/icon_widget.dart';
import 'package:github_treasures/feature/common/presentation/widgets/common_text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  static const double appBarHeight = DimensionConst.value50;
  final String title;
  final TextStyle titleStyle;
  final String? subTitle;
  final TextStyle subTitleStyle;
  final bool implyLeading;
  final double? appBarElevation;
  final void Function()? leadingWidgetTapEvent;
  final bool isItDashboardScreen;
  final bool? isItBeforeLogin;

  const AppBarWidget({
    super.key,
    required this.title,
    this.implyLeading = false,
    this.subTitle,
    this.appBarElevation,
    this.titleStyle = TypographyResource.textStyleF16W500,
    this.subTitleStyle = TypographyResource.textStyleF14W400,
    this.leadingWidgetTapEvent,
    this.isItDashboardScreen = false,
    this.isItBeforeLogin = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: implyLeading
          ? _makeLeadingWidget(() => Navigator.pop(context))
          : null,
      titleSpacing: 0,
      automaticallyImplyLeading: implyLeading,
      elevation: appBarElevation,
      title: _makeTitle(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  Widget _makeTitle() {
    final Offset offset = implyLeading
        ? const Offset(
            -24,
            0,
          )
        : const Offset(
            0,
            0,
          );
    return Transform.translate(
      offset: offset,
      child: Row(
        children: [
          const SizedBox(width: DimensionConst.value16),
          const FaIcon(
            color: ColorsResource.whiteColor,
            FontAwesomeIcons.github,
            size: DimensionConst.value24,
          ),
          const SizedBox(
            width: DimensionConst.value8,
          ),
          Flexible(child: _makeTitleColumn()),
        ],
      ),
    );
  }

  Widget _makeTitleColumn() {
    if (subTitle == null || subTitle!.isEmpty) {
      return Container(
        alignment: Alignment.centerLeft,
        height: appBarHeight,
        child: CommonTextWidget(
          text: title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: titleStyle.copyWith(color: ColorsResource.whiteColor),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: title,
          style: titleStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        CommonTextWidget(
          text: subTitle!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subTitleStyle..copyWith(color: ColorsResource.whiteColor),
        )
      ],
    );
  }

  Widget _makeLeadingWidget(void Function() defaultTapEvent) {
    return InkWell(
      onTap: leadingWidgetTapEvent ?? defaultTapEvent,
      child: const SizedBox(
        height: appBarHeight,
        width: appBarHeight,
        child: IconWidget(
          icon: Icons.arrow_back,
          color: ColorsResource.whiteColor,
        ),
      ),
    );
  }
}
