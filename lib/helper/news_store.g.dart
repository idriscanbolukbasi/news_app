// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStoreBase, Store {
  final _$categoryAtom = Atom(name: '_NewsStoreBase.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$isSearchActiveAtom = Atom(name: '_NewsStoreBase.isSearchActive');

  @override
  bool get isSearchActive {
    _$isSearchActiveAtom.reportRead();
    return super.isSearchActive;
  }

  @override
  set isSearchActive(bool value) {
    _$isSearchActiveAtom.reportWrite(value, super.isSearchActive, () {
      super.isSearchActive = value;
    });
  }

  final _$isSearchedAtom = Atom(name: '_NewsStoreBase.isSearched');

  @override
  bool get isSearched {
    _$isSearchedAtom.reportRead();
    return super.isSearched;
  }

  @override
  set isSearched(bool value) {
    _$isSearchedAtom.reportWrite(value, super.isSearched, () {
      super.isSearched = value;
    });
  }

  final _$searchHistoryAtom = Atom(name: '_NewsStoreBase.searchHistory');

  @override
  ObservableList<String> get searchHistory {
    _$searchHistoryAtom.reportRead();
    return super.searchHistory;
  }

  @override
  set searchHistory(ObservableList<String> value) {
    _$searchHistoryAtom.reportWrite(value, super.searchHistory, () {
      super.searchHistory = value;
    });
  }

  final _$articlesAtom = Atom(name: '_NewsStoreBase.articles');

  @override
  ObservableFuture<List<Article>> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableFuture<List<Article>> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  final _$searchedArticlesAtom = Atom(name: '_NewsStoreBase.searchedArticles');

  @override
  ObservableList<Article> get searchedArticles {
    _$searchedArticlesAtom.reportRead();
    return super.searchedArticles;
  }

  @override
  set searchedArticles(ObservableList<Article> value) {
    _$searchedArticlesAtom.reportWrite(value, super.searchedArticles, () {
      super.searchedArticles = value;
    });
  }

  final _$_NewsStoreBaseActionController =
      ActionController(name: '_NewsStoreBase');

  @override
  void changeCategory(String cat) {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.changeCategory');
    try {
      return super.changeCategory(cat);
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeHistory(String key) {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.removeHistory');
    try {
      return super.removeHistory(key);
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<dynamic> search(String key) {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.search');
    try {
      return super.search(key);
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchArticles() {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.fetchArticles');
    try {
      return super.fetchArticles();
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchStatus() {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.changeSearchStatus');
    try {
      return super.changeSearchStatus();
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchedStatus() {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.changeSearchedStatus');
    try {
      return super.changeSearchedStatus();
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
isSearchActive: ${isSearchActive},
isSearched: ${isSearched},
searchHistory: ${searchHistory},
articles: ${articles},
searchedArticles: ${searchedArticles}
    ''';
  }
}
