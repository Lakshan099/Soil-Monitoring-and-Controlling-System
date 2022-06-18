import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:soil_npk_app/NewsRSS/network/repository.dart';

import '../domain/models/articles_model.dart';

class RepositoryImpl extends Repository {
  @override
  Future<List<Article>> getArticles() async {
    final Map<String, String> queryParams = {
      'country': 'us',
      'category': 'technology'
    };
    final headers = {HttpHeaders.authorizationHeader: _API_KEY};
    final uri = Uri.parse(_BASE_URL).replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final articles = articlesFromJson(response.body);
      return articles.articles;
    } else {
      throw Exception('response status code: ${response.statusCode}');
    }
  }

  static const String _BASE_URL = "http://newsapi.org/v2/top-headlines";

  // api key should be hidden to to prevent exposing it with static code analysis
  static const String _API_KEY = "4b6a63387bb74551bac7b10c46851f61";
}
