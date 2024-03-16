import 'package:flutter/material.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/widgets/repo_details_widget.dart';

class GithubRepoDetailsScreen extends StatelessWidget {
  final GithubRepoItemEntity repoItemEntity;

  const GithubRepoDetailsScreen({
    super.key,
    required this.repoItemEntity,
  });

  @override
  Widget build(BuildContext context) {
    return  RepoDetailsWidget(
      repoItemEntity: repoItemEntity,
    );
  }
}
