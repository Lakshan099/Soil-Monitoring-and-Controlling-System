// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);
// this class was created from app.quicktype.io

import 'dart:convert';

import 'package:intl/intl.dart';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

class Articles {
  Articles({
    this.status,
    this.totalResults,
    required this.articles,
  });

  String? status;
  int? totalResults;
  List<Article> articles;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );
}

class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateFormatter.dateFormat.format(DateTime.parse(json["publishedAt"])),
    content: json["content"],
  );
}

class DateFormatter {
  static DateFormat dateFormat = DateFormat('yyyy-MM-dd');
}
