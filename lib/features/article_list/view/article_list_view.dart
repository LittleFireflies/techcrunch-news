import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_event.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_state.dart';
import 'package:tech_crunch_news/repositories/api/api_service.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';

class ArticleListPage extends StatelessWidget {
  static const routeName = '/articleListView';

  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(
        apiService: ApiService(
          Client(),
        ),
      ),
      child: BlocProvider(
        create: (context) => ArticleListBloc(
          repository: context.read<NewsRepository>(),
        )..add(const LoadArticleListEvent()),
        child: const ArticleListView(),
      ),
    );
  }
}

class ArticleListView extends StatelessWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechCrunch News'),
      ),
      body: BlocBuilder<ArticleListBloc, ArticleListState>(
        builder: (context, state) {
          if (state is ArticleListLoadErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ArticleListLoadSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final article = state.articles[index];

                return ListTile(
                  leading: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                  title: Text(
                    article.title,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    article.description,
                    maxLines: 2,
                  ),
                );
              },
              itemCount: state.articles.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
