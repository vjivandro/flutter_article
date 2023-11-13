import '../entity/article_entity.dart';
import '../repository/article_repository.dart';

class GetRecentArticleUseCase {
  final ArticleRepository newsRepositoryImpl;
  GetRecentArticleUseCase(this.newsRepositoryImpl);
  Future<List<ArticleEntity>> call() async {
    return newsRepositoryImpl.getRecentArticle();
  }
}