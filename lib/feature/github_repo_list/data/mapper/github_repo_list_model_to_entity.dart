import 'package:github_treasures/core/data/mapper/mapper.dart';
import 'package:github_treasures/feature/github_repo_list/data/model/github_repo_item_model.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';

class GithubRepoListModelToEntityMapper
    extends Mapper<List<GithubRepoItemModel>, List<GithubRepoItemEntity>> {
  const GithubRepoListModelToEntityMapper();

  @override
  List<GithubRepoItemEntity> map(List<GithubRepoItemModel> tFrom) =>
      tFrom.map(_modelToEntity).toList();

  List<GithubRepoItemEntity> entityListMap(List<GithubRepoItemModel?> tFrom) {
    return tFrom.map(_modelToEntitys).toList();
  }

  GithubRepoItemEntity _modelToEntity(GithubRepoItemModel model) {
    return GithubRepoItemEntity(
      name: model.name,
      id: model.id,
      nodeId: model.nodeId,
      fullName: model.fullName,
      url: model.url,
      htmlUrl: model.htmlUrl,
      ownerLogin: model.ownerLogin,
      description: model.description,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      score: model.score,
      stars: model.stars,
      topics: model.topics,
      ownerAvatarUrl: model.ownerAvatar,
    );
  }

  GithubRepoItemEntity _modelToEntitys(GithubRepoItemModel? model) {
    return GithubRepoItemEntity(
      name: model!.name,
      id: model.id,
      nodeId: model.nodeId,
      fullName: model.fullName,
      url: model.url,
      htmlUrl: model.htmlUrl,
      ownerLogin: model.ownerLogin,
      description: model.description,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      score: model.score,
      stars: model.stars,
      topics: model.topics,
      ownerAvatarUrl: model.ownerAvatar,
    );
  }
}
