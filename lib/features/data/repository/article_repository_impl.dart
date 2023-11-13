import 'package:articleapp/features/data/api/article_api.dart';
import 'package:articleapp/features/domain/entity/article_entity.dart';
import 'package:articleapp/features/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleApi articleApi;
  final String apiKey;
  ArticleRepositoryImpl({
    required this.articleApi,
    required this.apiKey,
  });

  @override
  Future<List<ArticleEntity>> getRecentArticle() {
    return articleApi.getRecentArticle();
  }
}