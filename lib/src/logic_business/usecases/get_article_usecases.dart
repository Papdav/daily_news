import '../../data/models/news_api_response.dart';
import '../../data/repositories/article_repository.dart';

abstract class UseCase<T>{
  Future<T> call();
}
class GetArticlesUseCase implements UseCase<NewsApiResponse>{
  GetArticlesUseCase(this._articlesRepository);
  final ArticleRepository _articlesRepository;

  @override
  Future<NewsApiResponse> call(){
    return _articlesRepository.fetchNewsArticle();
  }
}