import '../datasources/remote/news_api_service.dart';
import '../models/news_api_response.dart';

class ArticleRepository{
  final NewsApiService newsApiService;

  ArticleRepository(this.newsApiService);

  Future<NewsApiResponse> fetchNewsArticle() async {
    final newsResponse = await newsApiService.fetchNewsArticle();
    return newsResponse;
  }
}