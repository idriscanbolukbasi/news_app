import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:newsapp/helper/news_store.dart';
import 'package:newsapp/models/Article.dart';
import 'package:newsapp/views/BlogTile.dart';

class NewsView extends StatelessWidget {
  NewsView({Key key, @required this.articles}) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Article article = articles[index];
          return BlogTile(
              imageUrl: article.image,
              title: article.title,
              description: article.description,
              url: article.link);
        });
  }
}
