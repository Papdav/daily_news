part of 'article_model_bloc.dart';

abstract class ArticleModelState extends Equatable {
  const ArticleModelState();

}

class ArticleModelLoadingSate extends ArticleModelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ArticleModelLoadedState extends ArticleModelState {

  final String newsResponseStatus;
  final int newsResponseTotalResults;
  final List<ArticleModel> newsResponseArticles;

  const ArticleModelLoadedState(
    this.newsResponseStatus,
    this.newsResponseTotalResults,
    this.newsResponseArticles,
);

  @override
  // TODO: implement props
  List<Object?> get props => [newsResponseStatus,newsResponseTotalResults,newsResponseArticles];

}

class ArticleModelNoInternetState extends ArticleModelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
