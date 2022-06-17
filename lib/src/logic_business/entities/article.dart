import 'package:daily_news/src/logic_business/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {

  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  const Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [source,author,title,description,url,urlToImage,publishedAt,content];
}