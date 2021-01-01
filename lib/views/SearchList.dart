import 'package:flutter/material.dart';
import 'package:newsapp/models/Article.dart';
import 'package:newsapp/views/BlogTile.dart';

class SearchList extends StatelessWidget {
  SearchList({Key key, @required this.searchedArticles}) : super(key: key);

  final List<Article> searchedArticles;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: searchedArticles.isEmpty
            ? Center(
                child: Text("Aradığınız kelimeyle ilgili bir haber bulunamadı"),
              )
            : ListView.builder(
                itemCount: this.searchedArticles.length,
                itemBuilder: (context, index) {
                  Article article = this.searchedArticles[index];
                  return BlogTile(
                      imageUrl: article.image,
                      title: article.title,
                      description: article.description,
                      url: article.link);
                }));
  }
}
