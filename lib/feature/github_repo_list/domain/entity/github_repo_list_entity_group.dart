import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';

part 'github_repo_list_entity_group.freezed.dart';

@freezed
class GithubRepoListEntityGroup with _$GithubRepoListEntityGroup {
  const factory GithubRepoListEntityGroup.success(
      List<GithubRepoItemEntity> entityList) = _Success;
  const factory GithubRepoListEntityGroup.notFound() = _NotFound;
  const factory GithubRepoListEntityGroup.badRequest() = _BadRequest;
  const factory GithubRepoListEntityGroup.forbidden() = _Forbidden;
  const factory GithubRepoListEntityGroup.unKnown() = _Unknown;
}
