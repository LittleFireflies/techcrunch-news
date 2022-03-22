import 'package:equatable/equatable.dart';

abstract class ArticleListEvent extends Equatable {
  const ArticleListEvent();
}

class LoadArticleListEvent extends ArticleListEvent {
  const LoadArticleListEvent();

  @override
  List<Object?> get props => [];
}
