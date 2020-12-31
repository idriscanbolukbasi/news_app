import 'package:newsapp/models/Category.dart';

List<Category> getCategories() {
  List<Category> categories = new List<Category>();

  Category category = new Category();
  category.categoryName = "İş Dünyası";
  category.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80";
  category.url = "Business";
  categories.add(category);

  category = new Category();
  category.categoryName = "Eğlence";
  category.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.url = "Entertainment";
  categories.add(category);

  category = new Category();
  category.categoryName = "Gündem";
  category.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.url = "General";
  categories.add(category);

  category = new Category();
  category.categoryName = "Sağlık";
  category.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.url = "Health";
  categories.add(category);

  category = new Category();
  category.categoryName = "Bilim";
  category.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.url = "Science";
  categories.add(category);

  category = new Category();
  category.categoryName = "Spor";
  category.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.url = "Sports";
  categories.add(category);

  category = new Category();
  category.categoryName = "Teknoloji";
  category.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.url = "Technology";
  categories.add(category);

  return categories;
}
