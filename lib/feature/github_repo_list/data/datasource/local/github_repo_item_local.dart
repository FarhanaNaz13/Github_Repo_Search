import 'package:github_treasures/feature/github_repo_list/data/model/github_repo_item_model.dart';
import 'package:hive/hive.dart';

class GitHubRepoItemLocal {
  GitHubRepoItemLocal({required Box<GithubRepoItemModel?> githubRepoBox})
      : _githubRepoBox = githubRepoBox;

  final Box<GithubRepoItemModel?> _githubRepoBox;

  Future<void> saveReposLocally({
    required List<GithubRepoItemModel> githubRepos,
  }) async {
    for (final githubRepo in githubRepos) {
      await _githubRepoBox.put(githubRepo.id, githubRepo);
    }
  }

  Future<List<GithubRepoItemModel?>> fetchAllLocalRepos() async {
    return _githubRepoBox.values.toList();
    ;
  }
}
