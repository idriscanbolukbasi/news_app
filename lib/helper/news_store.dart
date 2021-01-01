import 'package:mobx/mobx.dart';
import 'package:newsapp/helper/rss_read.dart';
import 'package:newsapp/models/Article.dart';

part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  RssReader service = RssReader();

  @observable
  String category = "guncel";

  @observable
  bool isSearchActive = false;

  @observable
  bool isSearched = false;

  @observable
  ObservableList<String> searchHistory = ObservableList();

  @observable
  ObservableFuture<List<Article>> articles;

  @observable
  ObservableList<Article> searchedArticles = ObservableList();

  @action
  void changeCategory(String cat) {
    this.category = cat;
    this.getArticles();
  }

  @action
  removeHistory(String key) {
    searchHistory.remove(key);
  }

  @action
  List search(String key) {
    isSearchActive = false;
    isSearched = true;
    if (!searchHistory.contains(key)) {
      searchHistory.insert(0, key);
    }
    return searchedArticles = service.search(key: key).asObservable();
  }

  @action
  Future fetchArticles() =>
      articles = ObservableFuture(service.fetchArticles(cat: this.category));

  @action
  void changeSearchStatus() {
    isSearchActive = !isSearchActive;
  }

  @action
  void changeSearchedStatus() {
    isSearched = !isSearched;
  }

  void getArticles() {
    fetchArticles();
  }
}
