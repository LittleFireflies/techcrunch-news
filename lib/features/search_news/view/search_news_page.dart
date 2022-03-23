import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_crunch_news/features/article_list/widgets/news_card.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_bloc.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_event.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_state.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';
import 'package:tech_crunch_news/widgets/news_app_bar.dart';

class SearchNewsPage extends StatelessWidget {
  static const routeName = 'searchNewsPage';

  final String initialQuery;

  const SearchNewsPage({Key? key, required this.initialQuery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchNewsBloc(
        newsRepository: context.read<NewsRepository>(),
      )..add(SearchByKeywordsEvent(keyword: initialQuery)),
      child: const SearchNewsView(),
    );
  }
}

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const NewsSliverAppBar(),
          BlocBuilder<SearchNewsBloc, SearchNewsState>(
            builder: (context, state) {
              if (state is SearchSuccessState) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final article = state.articles[index];

                      return NewsCard(article: article);
                    },
                    childCount: state.articles.length,
                  ),
                );
              } else if (state is SearchEmptyState) {
                return const SliverFillRemaining(
                  child: Center(
                    child:
                        Text("We couldn't find the news you're looking for :("),
                  ),
                );
              } else if (state is SearchErrorState) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
