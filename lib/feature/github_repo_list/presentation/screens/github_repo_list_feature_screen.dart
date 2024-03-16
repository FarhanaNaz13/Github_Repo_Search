import 'package:flutter/material.dart';
import 'package:github_treasures/core/resource/dimension_const.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/widgets/github_repo_list.dart';

class GithubRepoListFeatureScreen extends StatefulWidget {
  const GithubRepoListFeatureScreen({super.key});

  @override
  State<GithubRepoListFeatureScreen> createState() =>
      _GithubRepoListFeatureScreenState();
}

class _GithubRepoListFeatureScreenState
    extends State<GithubRepoListFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(DimensionConst.value16),
        padding: const EdgeInsets.all(DimensionConst.value16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              DimensionConst.value16 / DimensionConst.value3),
        ),
        child: const RepoList(),
      ),
    );
  }
}
