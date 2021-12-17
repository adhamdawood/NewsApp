import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/NewsScreen/NewsListScreen.dart';
import 'package:news_app_back_on_track/model/APIs/articles_response.dart';
import 'package:news_app_back_on_track/model/APIs/sources_response.dart';
import 'package:http/http.dart' as http;


class NewsList extends StatefulWidget {
  Sources source;
  NewsList(this.source);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Future<ArticlesResponse> articlesResponse;
  @override
  void initState() {
    // TODO: implement initState
    articlesResponse=LoadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<ArticlesResponse>
          ( future: articlesResponse,
            builder: (buildContext,snapShot){
              if(snapShot.hasError){
                return Text(snapShot.error.toString());
              }else if(snapShot.hasData){
                return ListView.builder(itemBuilder: (context,index){
                  return NewsListScreen(article: snapShot.data.articles[index]);
                },
                  itemCount: snapShot.data.articles.length,);
              }else{
                return Center(child: CircularProgressIndicator());
              }
            });
  }
  Future<ArticlesResponse>LoadArticles() async{
    Uri uri= Uri.https("newsapi.org", "/v2/everything",{
      'apiKey':'e1ebda0a37234980b1579caf2edaf629',
      'sources' : widget.source.id,
    });
    final ArtcilesResponse = await http.get(uri);
    if(ArtcilesResponse.statusCode==200){
      return ArticlesResponse.fromJson(jsonDecode(ArtcilesResponse.body));
    }else{
      throw(Exception(ArtcilesResponse.body));
    }

  }
}
