import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

Widget articlesContent(
    BuildContext context, AsyncSnapshot<News> snapshots, int index) {
  var article = snapshots.data.articles[index];
  TextStyle textStyle =
      Theme.of(context).textTheme.headline6.copyWith(fontSize: 20);
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Image.network(article.urlToImage),
          Text(
            article.title,
            style: textStyle.copyWith(fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            article.description,
            style: textStyle.copyWith(color: Colors.grey, fontSize: 17),
          ),
          Row(
            children: [
              Text('Source: '),
              Text(article.source.name),
            ],
          ),
          Row(
            children: [
              Text('Author: '),
              Text(article.author),
            ],
          ),
          InkWell(
              child: Text(
                article.url,
                style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    fontSize: 16),
              ),
              onTap: () {
                launch(article.url);
              })
        ],
      ),
    ),
  );
}
