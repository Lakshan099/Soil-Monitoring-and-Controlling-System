import 'package:flutter/material.dart';
import 'package:soil_npk_app/NewsRSS/UI/screenArticleDetails/screen_article_details.dart';

import '../../domain/models/articles_model.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToArticleDetails(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleAndDescription(context),
              ImageAndIcon(context)
            ]
        ),
      ),
    );
  }

  void navigateToArticleDetails(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScreenArticleDetails(
              article: article,
            )));
  }

  Widget TitleAndDescription(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 8),
            child: Text(
              article.title ?? "No title",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(article.description ?? "No description",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 3)),
        ],
      ),
    );
  }

  Widget ImageAndIcon(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.width / 3.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      article.urlToImage ?? ImageURLS.DEFAULT_IMG_URL)),
              borderRadius: BorderRadiusDirectional.circular(8)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.more_horiz,
          color: Color.fromARGB(191, 163, 163, 163),
        )
      ],
    );
  }
}

class ImageURLS {
  static const DEFAULT_IMG_URL =
      "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc=";
}
