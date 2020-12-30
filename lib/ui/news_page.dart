import 'package:flutter/material.dart';
import 'package:newsapp/model/network.dart';
import 'package:newsapp/model/news_model.dart';

import 'articles_content.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  //Creating a future variable of Our news class
  Future<News> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network();
    news = network.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Tech News Around The World'),
      ),
      body: FutureBuilder(
          future: news,
          builder: (context, AsyncSnapshot<News> snapshots) {
            if (snapshots.hasData)
              return Center(
                child: GridView.builder(
                  itemCount: snapshots.data.articles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .6,
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    return articlesContent(context, snapshots, index);
                  },
                ),
              );
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}


