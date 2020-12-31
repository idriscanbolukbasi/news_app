import 'package:flutter/material.dart';
import 'package:newsapp/helper/news_store.dart';
import 'package:newsapp/views/CategoryTile.dart';

class CategorySection extends StatelessWidget {
  CategorySection({Key key, @required this.store}) : super(key: key);
  final NewsStore store;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryTile(
            categoryName: "Güncel",
            imageUrl:
                "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
            url: "guncel",
            store: store,
          ),
          CategoryTile(
            categoryName: "Eğitim",
            imageUrl:
                "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
            url: "egitim",
            store: store,
          ),
          CategoryTile(
            categoryName: "Yaşam",
            imageUrl:
                "https://images.unsplash.com/photo-1474452926969-af7bfdb9ca39?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80",
            url: "yasam",
            store: store,
          ),
          CategoryTile(
            categoryName: "Sağlık",
            imageUrl:
                "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80",
            url: "saglik",
            store: store,
          ),
          CategoryTile(
            categoryName: "Ekonomi",
            imageUrl:
                "https://images.unsplash.com/photo-1565374391015-af899382f2a6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
            url: "ekonomi",
            store: store,
          ),
          CategoryTile(
            categoryName: "Spor",
            imageUrl:
                "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
            url: "spor",
            store: store,
          ),
        ],
      ),
    );
  }
}
