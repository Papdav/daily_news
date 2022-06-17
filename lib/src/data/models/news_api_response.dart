import 'package:daily_news/src/data/models/article_model.dart';

class NewsApiResponse {

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<ArticleModel> articles;

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) =>
      NewsApiResponse(
        status: (json["status"] == null) ? '' : json["status"],
        totalResults: (json["totalResults"] == null) ? 0 : json["totalResults"] as int,
        articles: List<ArticleModel>.from(
            json["articles"].map((x) => ArticleModel.fromJson(x))),
      );
}