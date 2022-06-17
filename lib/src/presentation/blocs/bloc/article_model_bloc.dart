import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daily_news/src/data/datasources/remote/connectivity_service.dart';
import 'package:daily_news/src/data/datasources/remote/news_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/article_model.dart';

part 'article_model_event.dart';
part 'article_model_state.dart';

class ArticleModelBloc extends Bloc<ArticleModelEvent, ArticleModelState> {
  final NewsApiService _newsApiService ;
  final ConnectivityService _connectivityService ;

  ArticleModelBloc(this._newsApiService ,this._connectivityService) : super(ArticleModelLoadingSate()) {

    _connectivityService.connectivityStream.stream.listen((event){
      if(event == ConnectivityResult.none){
        add(NoInternetEvent());
      }
      else{
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(ArticleModelLoadingSate());
      final newsApiResponse = await _newsApiService.fetchNewsArticle();
      emit(ArticleModelLoadedState(newsApiResponse.status,newsApiResponse.totalResults,newsApiResponse.articles));
    });

    on<NoInternetEvent>((event,emit){
      emit(ArticleModelNoInternetState());
    });
  }
}
