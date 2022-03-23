import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_crunch_news/api/interceptor/error_interceptor.dart';
import 'package:tech_crunch_news/api/models/article.dart';
import 'package:tech_crunch_news/features/article_detail/view/article_detail_view.dart';
import 'package:tech_crunch_news/features/article_list/view/article_list_view.dart';
import 'package:tech_crunch_news/features/article_webview/view/article_webview.dart';
import 'package:tech_crunch_news/features/search_news/view/search_news_page.dart';
import 'package:tech_crunch_news/api/api_service.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';
import 'package:tech_crunch_news/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultTimeoutInSeconds = 60 * 1000;
    final dio = Dio(
      BaseOptions(
        connectTimeout: defaultTimeoutInSeconds,
        receiveTimeout: defaultTimeoutInSeconds,
        sendTimeout: defaultTimeoutInSeconds,
      ),
    );
    dio.interceptors.add(ErrorInterceptor());

    return RepositoryProvider(
      create: (context) => NewsRepository(
        apiService: ApiService(
          dio,
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: NewsTheme.mainTheme(),
        initialRoute: ArticleListPage.routeName,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case ArticleListPage.routeName:
              return MaterialPageRoute(
                  builder: (context) => const ArticleListPage());
            case ArticleDetailPage.routeName:
              final article = settings.arguments as Article;
              return MaterialPageRoute(
                builder: (context) => ArticleDetailPage(article: article),
                settings: settings,
              );
            case ArticleWebview.routeName:
              final url = settings.arguments as String;

              return MaterialPageRoute(
                builder: (context) => ArticleWebview(url: url),
                settings: settings,
              );
            case SearchNewsPage.routeName:
              final query = settings.arguments as String;

              return MaterialPageRoute(
                builder: (context) => SearchNewsPage(initialQuery: query),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
