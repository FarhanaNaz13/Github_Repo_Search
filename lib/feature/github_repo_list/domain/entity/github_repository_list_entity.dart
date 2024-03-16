import 'package:equatable/equatable.dart';

class GithubRepositoryListEntity extends Equatable {
  final int totalCount;
  final List<GithubRepoItemEntity> items;

  const GithubRepositoryListEntity({
    required this.totalCount,
    required this.items,
  });

  @override
  List<Object?> get props => [
        items,
        totalCount,
      ];
}

class GithubRepoItemEntity extends Equatable {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final String ownerLogin;
  final String htmlUrl;
  final String? description;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double score;
  final String ownerAvatarUrl;
  final int stars;
  final String? language;
  final List<String> topics;
  final String? homepage;
  final String? license;

  const GithubRepoItemEntity({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.ownerLogin,
    required this.htmlUrl,
    required this.description,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.score,
    required this.ownerAvatarUrl,
    required this.stars,
    this.language,
    required this.topics,
    this.homepage,
    this.license,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        fullName,
        ownerLogin,
        createdAt,
        updatedAt,
        score,
        description,
        htmlUrl,
        url,
        name,
        nodeId,
        license,
        ownerAvatarUrl,
        topics,
        homepage,
        stars
      ];
}
