import 'package:articleapp/core/di/service_locator.dart';
import 'package:articleapp/features/presentation/article/article_screen/article_screen.dart';
import 'package:articleapp/features/presentation/article/bloc/article_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider.value(
            value: serviceLocator<ArticleBloc>()
              ..add(ArticleGetRecentArticleEvent()),
            child: const ArticleScreen(),
          );
        },
      )
    ]);
  }
}
