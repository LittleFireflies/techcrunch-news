import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_event.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_state.dart';
import 'package:tech_crunch_news/repositories/api/api_service.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find the Latest Update',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for News',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Featured Stories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<ArticleListBloc, ArticleListState>(
                builder: (context, state) {
                  if (state is ArticleListLoadErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is ArticleListLoadSuccessState) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final article = state.articles[index];

                        return NewsCard(article: article);
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
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            article.urlToImage,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Read news',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 48,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
