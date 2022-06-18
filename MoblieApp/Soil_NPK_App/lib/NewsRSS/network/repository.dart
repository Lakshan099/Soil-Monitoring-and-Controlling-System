import '../domain/models/articles_model.dart';

abstract class Repository {
  Future<List<Article>> getArticles();
}