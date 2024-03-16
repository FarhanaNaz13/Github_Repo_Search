import 'package:flutter/material.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';
import 'package:github_treasures/core/resource/constant/utils/extensions.dart';
import 'package:github_treasures/core/resource/constant/utils/utility.dart';
import 'package:github_treasures/core/resource/dimension_const.dart';
import 'package:github_treasures/feature/common/presentation/widgets/app_bar_widget.dart';
import 'package:github_treasures/feature/common/presentation/widgets/assets/common_cached_network_image.dart';
import 'package:github_treasures/feature/common/presentation/widgets/assets/icon_widget.dart';
import 'package:github_treasures/feature/common/presentation/widgets/common_text_widget.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';

class RepoDetailsWidget extends StatelessWidget {
  final GithubRepoItemEntity repoItemEntity;
  const RepoDetailsWidget({
    super.key,
    required this.repoItemEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Github Repository Details',
        implyLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
            vertical: DimensionConst.value16 / DimensionConst.value2),
        padding: const EdgeInsets.all(DimensionConst.value16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsResource.whiteColor,
          borderRadius: BorderRadius.circular(
              DimensionConst.value16 / DimensionConst.value3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCardHeader(context),
            if (repoItemEntity.description != null)
              getCardDescription(context),
            if (repoItemEntity.topics.isNotEmpty) getCardTopics(context),
            getCardFooter(context),
          ],
        ),
      ),
    );
  }

  Widget getCardHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: repoItemEntity.fullName,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorsResource.colorDeepBlue, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: DimensionConst.value8 ),

        CommonCachedNetworkImage(
          imagePath: repoItemEntity.ownerAvatarUrl,
          width: DimensionConst.value100,
        ),

      ],
    );
  }

  Widget getCardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: DimensionConst.value16 / DimensionConst.value2),
      child: CommonTextWidget(
        text: repoItemEntity.description ?? '',
        overflow: TextOverflow.ellipsis,
        maxLines: 6,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget getCardTopics(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: DimensionConst.value16 / DimensionConst.value2),
      child: Wrap(
        spacing: DimensionConst.value16 / DimensionConst.value2,
        runSpacing: DimensionConst.value16 / DimensionConst.value2,
        children: repoItemEntity.topics
            .map(
              (t) => Container(
                padding: const EdgeInsets.symmetric(
                    vertical: DimensionConst.value16 / DimensionConst.value10,
                    horizontal: DimensionConst.value16 / DimensionConst.value2),
                decoration: BoxDecoration(
                  color: ColorsResource.colorDeepBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DimensionConst.value16),
                ),
                child: CommonTextWidget(
                  text: t,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsResource.colorDeepBlue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getCardFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: DimensionConst.value16 / DimensionConst.value2),
      child: Wrap(
        children: [
          if (repoItemEntity.language != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconWidget(
                  icon: Icons.circle,
                  size: DimensionConst.value10,
                  color: getLanguageColor(repoItemEntity.language),
                ),
                const SizedBox(
                    width: DimensionConst.value16 / DimensionConst.value3),
                CommonTextWidget(
                  text: repoItemEntity.language ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorsResource.colorSlateGray),
                ),
                CommonTextWidget(
                  text: "  ·  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorsResource.colorSlateGray),
                ),
              ],
            ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const IconWidget(
                icon: Icons.star_border,
                size: DimensionConst.value16,
                color: ColorsResource.colorGoldenrod,
              ),
              const SizedBox(
                  width: DimensionConst.value16 / DimensionConst.value3),
              CommonTextWidget(
                text: repoItemEntity.stars.compactNumber(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorsResource.colorSlateGray),
              ),
              CommonTextWidget(
                text: "  ·  ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorsResource.colorSlateGray),
              ),

              CommonTextWidget(
                text: repoItemEntity.updatedAt.toTimeAgoLabel(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorsResource.colorSlateGray),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
