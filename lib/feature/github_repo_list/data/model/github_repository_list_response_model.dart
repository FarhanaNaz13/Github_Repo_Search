import 'dart:convert';
import 'package:github_treasures/feature/github_repo_list/data/model/github_repo_item_model.dart';
import 'package:hive/hive.dart';

class GithubRepositoryListModel extends HiveObject {
  final int totalCount;
  final List<GithubRepoItemModel> items;

  GithubRepositoryListModel({
    required this.totalCount,
    required this.items,
  });

  factory GithubRepositoryListModel.fromJson(String str) =>
      GithubRepositoryListModel.fromMap(json.decode(str));

  factory GithubRepositoryListModel.fromMap(Map<String, dynamic> json) =>
      GithubRepositoryListModel(
        totalCount: json["total_count"],
        items: List<GithubRepoItemModel>.from(
            json["items"].map((x) => GithubRepoItemModel.fromMap(x))),
      );
}



