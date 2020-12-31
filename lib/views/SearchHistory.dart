import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:newsapp/helper/news_store.dart';

class SearchHistory extends StatefulWidget {
  SearchHistory({Key key, @required this.store}) : super(key: key);

  final NewsStore store;

  _SearchHistoryState createState() => _SearchHistoryState(store: store);
}

class _SearchHistoryState extends State<SearchHistory> {
  _SearchHistoryState({@required this.store});
  NewsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: store.searchHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.restore),
                  title: InkWell(
                    onTap: () {
                      store.search(store.searchHistory[index]);
                    },
                    child: Text(store.searchHistory[index]),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        store.searchHistory.remove(store.searchHistory[index]);
                      }));
            });
      },
    );
  }
}
