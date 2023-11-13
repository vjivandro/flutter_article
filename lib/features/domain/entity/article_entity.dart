import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'article_entity.freezed.dart';
part 'article_entity.g.dart';

@freezed
class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    String? title,
    String? description,
    String? url,
    @JsonKey(name: 'urlToImage') String? imageUrl,
    String? publishedAt,
    String? content,
  }) = _ArticleEntity;

  factory ArticleEntity.fromJson(Map<String, Object?> json) =>
      _$ArticleEntityFromJson(json);
}
