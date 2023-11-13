import 'package:articleapp/features/domain/entity/article_entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleEntity>> getRecentArticle();
}