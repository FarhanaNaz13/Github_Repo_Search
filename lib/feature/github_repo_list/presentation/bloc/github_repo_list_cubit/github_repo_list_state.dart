part of 'github_repo_list_cubit.dart';

@freezed
class GithubRepoListState with _$GithubRepoListState {
  const factory GithubRepoListState.initial() = _Initial;
  const factory GithubRepoListState.loading() = _Loading;
  const factory GithubRepoListState.loaded(
      List<GithubRepoItemEntity> entityList) = _Loaded;
  const factory GithubRepoListState.failure(Failure failure) = _Failure;
  const factory GithubRepoListState.unKnown() = _Unknown;
  const factory GithubRepoListState.notFound() = _NotFound;
  const factory GithubRepoListState.badRequest() = _BadRequest;
  const factory GithubRepoListState.forbidden() = _Forbidden;
}
