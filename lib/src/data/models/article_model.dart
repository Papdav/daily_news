import 'package:daily_news/src/data/models/source_model.dart';
import 'package:daily_news/src/logic_business/entities/article.dart';

class ArticleModel extends Article {

  const ArticleModel({
    required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    source: SourceModel.fromJson(json["source"]),
    author: (json["author"] == null) ? '' : json["author"],
    title: (json["title"] == null) ? '' :json["title"],
    description: (json["description"] == null) ? '' : json["description"],
    url: (json["url"] == null) ? '' :json["url"],
    urlToImage: (json["urlToImage"] == null) ? '' : json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: (json["content"] == null) ? '' : json["content"],
  );

}