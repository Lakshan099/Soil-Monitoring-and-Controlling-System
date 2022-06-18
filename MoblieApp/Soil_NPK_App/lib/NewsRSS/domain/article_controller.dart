
import 'package:soil_npk_app/NewsRSS/locator.dart';
import 'package:soil_npk_app/NewsRSS/network/repository.dart';

import 'models/articles_model.dart';

class ArticleController {
  Future<List<Article>> getArticles() async {
    return locator.get<Repository>().getArticles();
  }
}