import 'dart:convert';
import 'package:daily_news/src/core/constants.dart';
import 'package:daily_news/src/data/models/news_api_response.dart';
import 'package:dio/dio.dart';


NewsApiResponse newsApiResponseFromJson(String str) => NewsApiResponse.fromJson(json.decode(str));

class NewsApiService {
  late Dio _dio;

  NewsApiService(){
    _dio = Dio();
  }

  Future<NewsApiResponse> fetchNewsArticle() async {
    try{
      final response = await _dio.get(url);
      final newsResponse = NewsApiResponse.fromJson(response.data);
      return newsResponse;
    } on DioError catch(e){
      print(e.toString());
      throw UnimplementedError();
    }
  }
}