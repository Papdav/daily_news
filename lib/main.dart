import 'package:daily_news/src/config/router.dart';
import 'package:daily_news/src/data/datasources/remote/connectivity_service.dart';
import 'package:daily_news/src/data/datasources/remote/news_api_service.dart';
import 'package:daily_news/src/presentation/views/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily News Application',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRouter.onGenerateRoutes,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => NewsApiService()
          ),
          RepositoryProvider(
              create: (context) => ConnectivityService()
          ),
        ],
        child: const ArticleScreen(),
      ),
    );
  }
}
