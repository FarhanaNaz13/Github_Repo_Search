import 'dart:convert';

import 'package:hive/hive.dart';
part 'github_repo_item_model.g.dart';

@HiveType(typeId: 0)
class GithubRepoItemModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nodeId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String fullName;
  @HiveField(4)
  final String ownerLogin;
  @HiveField(5)
  final String htmlUrl;
  @HiveField(6)
  final String? description;
  @HiveField(7)
  final String url;
  @HiveField(8)
  final DateTime createdAt;
  @HiveField(9)
  final DateTime updatedAt;
  @HiveField(10)
  final String ownerAvatar;
  @HiveField(11)
  final double score;
  @HiveField(12)
  final int stars;
  @HiveField(13)
  final String? language;
  @HiveField(14)
  final List<String> topics;
  @HiveField(15)
  final String? homepage;
  @HiveField(16)
  final String? license;

  GithubRepoItemModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.ownerLogin,
    required this.htmlUrl,
    required this.description,
    required this.url,
    required this.createdAt,
    required this.ownerAvatar,
    required this.updatedAt,
    required this.score,
    required this.stars,
    this.language,
    required this.topics,
    this.homepage,
    this.license,
  });

  factory GithubRepoItemModel.fromJson(String str) =>
      GithubRepoItemModel.fromMap(json.decode(str));

  factory GithubRepoItemModel.fromMap(Map<String, dynamic> json) =>
      GithubRepoItemModel(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        ownerLogin: (json["owner"])?["login"],
        htmlUrl: json["html_url"],
        description: json["description"],
        url: json["url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ownerAvatar: (json["owner"])?["avatar_url"],
        score: json["score"]?.toDouble(),
        stars: json["watchers"],
        language: json["language"],
        topics: List<String>.from(json["topics"]),
        homepage: json["homepage"],
        license: (json["license"])?["name"],
      );
}
