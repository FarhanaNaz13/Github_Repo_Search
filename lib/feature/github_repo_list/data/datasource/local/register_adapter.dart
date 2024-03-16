// import 'package:github_treasures/feature/github_repo_list/data/datasource/local/github_repo_item_local.dart';
// import 'package:github_treasures/feature/github_repo_list/data/model/github_repo_item_model.dart';
// import 'package:github_treasures/feature/github_repo_list/data/model/owner_model.dart';
// import 'package:hive/hive.dart';
//
// Future<void> initialiseHive() async {
//   //key
//   const ownerKey = 'owner';
//   const repoItemKey = 'repo';
//   //adapters
//   Hive.registerAdapter(OwnerAdapter());
//   Hive.registerAdapter(GithubRepoItemModelAdapter());
//   //box
//   final ownerBox = await Hive.openBox<Owner?>(ownerKey);
//   final repoBox = await Hive.openBox<GithubRepoItemModel?>(repoItemKey);
//   //repos
//   // OwnerModelLocal(ownerBox: ownerBox);
//   GitHubRepoItemLocal(githubRepoBox: repoBox);
// }
