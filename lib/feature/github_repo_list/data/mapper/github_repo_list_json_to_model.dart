import 'dart:convert';

import 'package:github_treasures/core/data/mapper/mapper.dart';
import 'package:github_treasures/feature/github_repo_list/data/model/github_repo_item_model.dart';

class JsonToGithubRepoListModelMapper
    extends Mapper<String, List<GithubRepoItemModel>> {
  @override
  List<GithubRepoItemModel> map(String tFrom) {
    final jsonList = json.decode(tFrom)['items'] as List?;
    if (jsonList == null || jsonList.isEmpty) {
      return List<GithubRepoItemModel>.empty();
    }
    return jsonList.map((e) => GithubRepoItemModel.fromMap(e)).toList();
  }
}
