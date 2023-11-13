import 'package:articleapp/core/network/network_client.dart';
import 'package:articleapp/core/shared/constant.dart';
import 'package:articleapp/features/data/api/article_api.dart';
import 'package:articleapp/features/data/repository/article_repository_impl.dart';
import 'package:articleapp/features/domain/repository/article_repository.dart';
import 'package:articleapp/features/domain/usecase/get_recent_article_usecase.dart';
import 'package:articleapp/features/presentation/article/bloc/article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<Constant>(() => Constant());
  serviceLocator.registerFactory<Dio>(
      () => NetworkClient(Dio(), constant: serviceLocator()).dio);

  //article
  serviceLocator.registerFactory<ArticleBloc>(() => ArticleBloc());
  serviceLocator.registerLazySingleton<ArticleApi>(() => ArticleApi(
      dio: serviceLocator(), apiKey: serviceLocator<Constant>().APIK_KEY));
  serviceLocator.registerLazySingleton<ArticleRepository>(() =>
      ArticleRepositoryImpl(
          articleApi: serviceLocator(),
          apiKey: serviceLocator<Constant>().APIK_KEY));
  serviceLocator.registerLazySingleton<GetRecentArticleUseCase>(
      () => GetRecentArticleUseCase(serviceLocator()));
}
