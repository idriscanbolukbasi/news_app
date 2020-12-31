import 'package:webfeed/domain/rss_item.dart';

class Article {
  final String link;
  final String title;
  final String description;
  final String pubDate;
  final String image;

  Article({this.link, this.title, this.description, this.pubDate, this.image});

  factory Article.fromJson(RssItem item) {
    String img;
    if (item.imageUrl != null) {
      img = item.imageUrl;
    } else if (item.enclosure != null) {
      img = item.enclosure.url;
    } else {
      img = "";
    }

    return Article(
        link: item.link ?? "",
        title: item.title ?? "",
        description: item.description ?? "_",
        pubDate: item.pubDate.toString() ?? "",
        image: img);
  }
}
