import 'dart:async';

import 'package:articleapp/features/domain/entity/article_entity.dart';
import 'package:articleapp/features/domain/usecase/get_recent_article_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/di/service_locator.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitialState()) {
    on<ArticleGetRecentArticleEvent>(mainArticleGetRecentArticleEvent);
  }

  FutureOr<void> mainArticleGetRecentArticleEvent(
      ArticleGetRecentArticleEvent event, Emitter<ArticleState> emit) async {
    try {
      emit(ArticleLoadingState());
      List<ArticleEntity> news =
      await serviceLocator<GetRecentArticleUseCase>().call();
      emit(ArticleGetRecentNewsSuccessState(news));
    } catch (e) {
      emit(ArticleErrorState("Something Went Wrong"));
    }
  }
}