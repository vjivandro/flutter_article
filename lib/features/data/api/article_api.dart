import 'package:articleapp/features/domain/entity/article_entity.dart';
import 'package:dio/dio.dart';

class ArticleApi {
  final Dio dio;
  final String apiKey;
  ArticleApi({required this.dio, required this.apiKey});
  Future<List<ArticleEntity>> getRecentArticle() async {
    final res = await dio
        .get('/v2/everything?q=indonesia&sortBy=publishedAt&apiKey=$apiKey');
    return List<Map<String, dynamic>>.from(res.data['articles'])
        .map((e) => ArticleEntity.fromJson(e))
        .toList();
  }

}