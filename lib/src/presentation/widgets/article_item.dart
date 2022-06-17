import 'package:flutter/material.dart';

import '../../data/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;
  const ArticleItem({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: ListTile(
        //onTap: () => _onPressedArticle(context, article),
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(article.urlToImage),
            ),
          ),
        ),
      ),
    );
  }
}

// void _onPressedArticle(BuildContext context, Article article){
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const ArticleDetailsScreen(article: article),
//     ),
//   );
// }
