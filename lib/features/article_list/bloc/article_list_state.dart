import 'package:equatable/equatable.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';

abstract class ArticleListState extends Equatable {
  const ArticleListState();
}

class ArticleListLoadingState extends ArticleListState {
  const ArticleListLoadingState();

  @override
  List<Object?> get props => [];
}

class ArticleListLoadSuccessState extends ArticleListState {
  final List<Article> articles;

  const ArticleListLoadSuccessState({required this.articles});

  @override
  List<Object?> get props => [articles];
}

class ArticleListLoadErrorState extends ArticleListState {
  final String message;

  const ArticleListLoadErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
