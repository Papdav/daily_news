import 'dart:convert';
import 'package:daily_news/src/core/constants.dart';
import 'package:daily_news/src/data/models/news_api_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';


NewsApiResponse newsApiResponseFromJson(String str) => NewsApiResponse.fromJson(json.decode(str));

class NewsApiService {


  Future<NewsApiResponse> fetchNewsArticle() async {
  final response = await get(Uri.parse(url));
  final newsResponse = newsApiResponseFromJson(response.body);
  return newsResponse;
  }
}