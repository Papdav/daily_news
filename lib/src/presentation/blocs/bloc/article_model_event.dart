part of 'article_model_bloc.dart';

abstract class ArticleModelEvent extends Equatable {
  const ArticleModelEvent();
}

class LoadApiEvent extends ArticleModelEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class NoInternetEvent extends ArticleModelEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}