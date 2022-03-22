import 'package:flutter/material.dart';
import 'package:tech_crunch_news/widgets/news_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebview extends StatelessWidget {
  static const routeName = 'articleWebView';

  final String url;

  const ArticleWebview({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: WebView(initialUrl: url),
    );
  }
}
