import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/NewsRSS/UI/screenArticleList/article_view.dart';
import 'package:soil_npk_app/NewsRSS/domain/article_controller.dart';
import 'package:soil_npk_app/NewsRSS/locator.dart';

import '../../domain/models/articles_model.dart';

class ScreenArticleList extends StatefulWidget {
  const ScreenArticleList({Key? key}) : super(key: key);

  @override
  State<ScreenArticleList> createState() => _ScreenArticleListState();
}

class _ScreenArticleListState extends State<ScreenArticleList> {
  Future<List<Article>>? _articles;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('News'),
          ],
        ),
        elevation: 1.0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getArticles();
        },
        child: FutureBuilder<List<Article>>(
          future: _articles,
          builder: (context, snapshot) {
            Widget data;
            if (snapshot.hasError) {
              Fluttertoast.showToast(msg: Message.ERROR_MESSAGE);
              data = Center(
                  child: Text(snapshot.error.toString(),
                      textAlign: TextAlign.center));
            } else if (snapshot.hasData) {
              Fluttertoast.showToast(msg: Message.SUCCESS_MESSAGE);
              final articleList = snapshot.data;
              data = articleList == null
                  ? const Center(child: Text('Received data is null'))
                  : ListView.builder(
                      itemCount: articleList.length,
                      itemBuilder: (context, i) {
                        return ArticleView(article: articleList[i]);
                      });
            } else {
              data = const Center(child: CircularProgressIndicator());
            }
            return data;
          },
        ),
      ),
    );
  }

  void getArticles() async {
    setState(() {
      _articles = locator.get<ArticleController>().getArticles();
    });
  }
}

class Message {
  static const SUCCESS_MESSAGE = "Successfully fetched data";
  static const ERROR_MESSAGE = "Failed to fetch data";
}
