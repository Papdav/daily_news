import 'package:daily_news/src/presentation/views/article_screen.dart';
import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../presentation/views/Articles_saved.dart';
import '../presentation/views/article_details_screen.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(
            builder: (_) => const ArticleScreen(),
        );
      case articleDetailsScreen :
        return MaterialPageRoute(
            builder: (_) => const ArticleDetailsScreen(),
        );
      case  articlesSaved :
        return MaterialPageRoute(
            builder: (_) => const ArticlesSaved(),
        );
      default:
        return null;
    }
  }
}