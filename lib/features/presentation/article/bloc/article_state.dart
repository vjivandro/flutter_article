part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  @override
  List<Object> get props => [];
}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleGetRecentNewsSuccessState extends ArticleState {
  final List<ArticleEntity> article;
  ArticleGetRecentNewsSuccessState(this.article);

  @override
  List<Object> get props => [article];
}

class ArticleErrorState extends ArticleState {
  final String message;
  ArticleErrorState(this.message);

  @override
  List<Object> get props => [message];
}