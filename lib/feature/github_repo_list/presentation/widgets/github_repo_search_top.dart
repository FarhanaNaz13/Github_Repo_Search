import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';
import 'package:github_treasures/core/resource/dimension_const.dart';
import 'package:github_treasures/core/resource/iconography.dart';
import 'package:github_treasures/feature/common/presentation/widgets/buttons/common_button.dart';
import 'package:github_treasures/feature/common/presentation/widgets/common_text_widget.dart';
import 'package:github_treasures/feature/common/resource/string_res.dart';

class GithubRepoSearchTop extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onPressed;
  final ValueChanged<String>? onChanged;

  const GithubRepoSearchTop({
    super.key,
    required this.searchController,
    required this.onPressed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            const FaIcon(
              color: ColorsResource.secondary,
              FontAwesomeIcons.github,
              size: DimensionConst.value50,
            ),
            const SizedBox(
                width: DimensionConst.value16 / DimensionConst.value2),
            CommonTextWidget(
              text: StringRes.searchRepoTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        const SizedBox(height: DimensionConst.value16),
        TextField(
          onChanged: onChanged,
          controller: searchController,
          cursorHeight: DimensionConst.value30,
          decoration: InputDecoration(
            hintText: StringRes.searchFieldHintText,
            prefixIcon: const Icon(Iconography.searchIcon),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: DimensionConst.value16),
              child: CommonButton(
                color: ColorsResource.deepBlackBrightColor,
                onPressed: onPressed,
                label: StringRes.search,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  DimensionConst.value16 / DimensionConst.value3),
              borderSide: const BorderSide(
                  color: ColorsResource.deepBlackColor,
                  width: DimensionConst.value0Point5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  DimensionConst.value16 / DimensionConst.value3),
              borderSide: const BorderSide(
                  color: ColorsResource.colorDeepBlue,
                  width: DimensionConst.value2),
            ),
          ),
        )
      ],
    );
  }
}
