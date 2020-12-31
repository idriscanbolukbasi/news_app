import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:newsapp/helper/news_store.dart';
import 'package:newsapp/models/Article.dart';
import 'package:newsapp/screens/Settings.dart';
import 'package:newsapp/views/CategorySection.dart';
import 'package:newsapp/views/NewsView.dart';
import 'package:newsapp/views/SearchHistory.dart';
import 'package:newsapp/views/SearchList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final NewsStore store = NewsStore();
  List<Article> searchedArticles;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    store.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Observer(
            builder: (_) {
              return IconButton(
                icon: Icon(
                  store.isSearched
                      ? Icons.arrow_back
                      : store.isSearchActive
                          ? Icons.close
                          : Icons.search,
                ),
                onPressed: () {
                  store.isSearched
                      ? store.changeSearchedStatus()
                      : store.changeSearchStatus();
                },
              );
            },
          ),
          actions: [
            Observer(builder: (_) {
              return store.isSearchActive
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingScreen()));
                      });
            })
          ],
          title: Observer(builder: (_) {
            return store.isSearchActive
                ? TextField(
                    decoration: InputDecoration(
                      hintText: "Aramak istediğiniz kelime...",
                    ),
                    controller: _searchController,
                    onSubmitted: (value) {
                      if (_searchController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Arama çubuğu boş bırakılamaz.");
                      } else {
                        this.searchedArticles =
                            store.search(_searchController.text);
                        _searchController.clear();
                      }
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Haber "),
                      Text(
                        "Uygulaması",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  );
          }),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Observer(builder: (_) {
              if (store.isSearched || store.isSearchActive) {
                return Container();
              }
              return CategorySection(store: store);
            }),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Observer(builder: (_) {
                  if (store.isSearched) {
                    return SearchList(searchedArticles: this.searchedArticles);
                  } else if (store.isSearchActive) {
                    return SearchHistory(store: store);
                  } else {
                    final future = store.articles;
                    switch (future.status) {
                      case FutureStatus.rejected:
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Haberler yüklenirken bir hata oluştu."),
                            SizedBox(height: 10),
                            RaisedButton(
                              child: Text("Yeniden denemek için tıklayın."),
                              onPressed: _refresh,
                            )
                          ],
                        ));

                      case FutureStatus.pending:
                        return Center(child: CircularProgressIndicator());

                      case FutureStatus.fulfilled:
                        final List<Article> articles = future.result;
                        return RefreshIndicator(
                          onRefresh: _refresh,
                          child: NewsView(
                            articles: articles,
                          ),
                        );
                        break;
                    }
                  }
                }),
              ),
            ),
          ],
        ));
  }

  Future _refresh() => store.fetchArticles();
}
