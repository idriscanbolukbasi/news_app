import 'package:http/http.dart' as http;
import 'package:newsapp/models/Article.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

/*
enum Source { aa, hurriyet, t24, aljazeera }
enum sourceCategories { aaCategory, hurriyetCategory }
enum aaCategory { guncel, egitim, yasam, saglik, ekonomi, spor }
enum hurriyetCategory { gundem, ekonomi, magazin, spor, teknoloji, saglik }
*/
class RssReader {
  //static RssReader instance = RssReader();

  List<Article> _articles = List();

  /*static RssReader get getInstance {
    return instance;
  }*/

  Future<List<Article>> fetchArticles({String cat = "guncel"}) async {
    var url = "https://www.aa.com.tr/tr/rss/default?cat=$cat";
    var response = await http.read(url);

    var channel = RssFeed.parse(response);

    _articles.clear();
    for (RssItem item in channel.items) {
      Article article = Article.fromJson(item);
      _articles.add(article);
    }

    return _articles;
  }

  List<Article> search({String key}) {
    List<Article> searchList = List();

    for (Article article in this._articles) {
      if (article.title.toLowerCase().contains(key)) {
        searchList.add(article);
      }
    }

    return searchList;
  }

  /*String buildUrl(Source source) {
    String finalUrl = "";
    switch (source) {
      case Source.aa:
        finalUrl += "https://www.aa.com.tr/tr/rss/default?cat=";
        switch(aa)
    }
  }*/
}

/*
AA:
güncel
eğitim
yaşam
sağlık
ekonomi
spor


*/
