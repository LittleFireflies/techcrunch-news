import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_event.dart';
import 'package:tech_crunch_news/features/article_list/widgets/article_list_header.dart';
import 'package:tech_crunch_news/features/article_list/widgets/article_list_item_view.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';
import 'package:tech_crunch_news/widgets/news_app_bar.dart';

class ArticleListPage extends StatelessWidget {
  static const routeName = 'articleListPage';

  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleListBloc(
        repository: context.read<NewsRepository>(),
      )..add(const LoadArticleListEvent()),
      child: const ArticleListView(),
    );
  }
}

class ArticleListView extends StatelessWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsSliverAppBar(),
          SliverToBoxAdapter(
            child: ArticleListHeader(),
          ),
          ArticleListItemView(),
        ],
      ),
    );
  }
}
