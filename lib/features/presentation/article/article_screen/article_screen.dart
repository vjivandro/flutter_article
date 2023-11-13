import 'package:articleapp/features/domain/entity/article_entity.dart';
import 'package:articleapp/features/presentation/article/bloc/article_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if(state is ArticleLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is ArticleErrorState) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                ),
              );
            }

            if(state is ArticleGetRecentNewsSuccessState) {

              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent News',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: Colors.white),
                          child: const Row(
                            children: [
                              Text(
                                'VIEW MORE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    childAspectRatio: 21 / 10,
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: state.article.map((article) => _articleItem(article)).toList(),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  Widget _articleItem(ArticleEntity article) {
    final borderRadius = BorderRadius.circular(10);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          if (article.imageUrl == null)
            const Center(
              child: Text(
                "No Image",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          if (article.imageUrl != null)

            CachedNetworkImage(
              imageUrl: article.imageUrl!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Text(
                  "No Image",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [0, 0.4, 0.6, 1],
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.8)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    if (article.publishedAt != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(999)),
                            child: Text(article.publishedAt!.split("T")[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        ],
                      )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(article.title?.trim() ?? '',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        )),
                    if (article.description != null)
                      Text(
                        article.description!.trim(),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[400],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
