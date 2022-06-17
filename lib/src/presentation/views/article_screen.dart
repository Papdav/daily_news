import 'package:daily_news/src/presentation/blocs/bloc/article_model_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../data/datasources/remote/connectivity_service.dart';
import '../../data/datasources/remote/news_api_service.dart';
import '../../data/models/article_model.dart';
import '../widgets/article_item.dart';
import 'Articles_saved.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  Widget _buildScaffoldWidget(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Daily News',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => _onShowSavedArticleViewTapped(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Icon(
                  Ionicons.bookmark,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ArticleModelBloc,ArticleModelState>(
          builder: (context,state){
            if(state is ArticleModelNoInternetState){
              return const Center(
                child: Text(
                  'No Internet',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              );
            }
            if(state is ArticleModelLoadingSate){
              return _showLoadingIndicator();
            }
            if(state is ArticleModelLoadedState){
              List<ArticleModel> articles = state.newsResponseArticles;
              int length = state.newsResponseArticles.length;
              return _buildLoadedListWidget(articles,length);
            }
            if(state is ArticleModelNoInternetState){
              return const Center(
                child: Text(
                  'No Internet',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              );
            }
            return Container();
          }
      ),
    );
  }
  Widget _showLoadingIndicator(){
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }
  Widget _buildLoadedListWidget(List<ArticleModel> articles,int length){

    return ListView.builder(
      itemCount: length,
      itemBuilder: (context,index){
        // TODO : not done
        return ArticleItem(article: articles[index]);
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleModelBloc(
        RepositoryProvider.of<NewsApiService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: _buildScaffoldWidget(),
    );
  }
}

void _onShowSavedArticleViewTapped(BuildContext context){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ArticlesSaved(),
    ),
  );
}

