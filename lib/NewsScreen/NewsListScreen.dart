import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/NewsScreen/NewsDetails.dart';
import 'package:news_app_back_on_track/model/APIs/articles_response.dart';

class NewsListScreen extends StatelessWidget {
  Articles article;
  NewsListScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(NewsDetails.ROUTE_NAME,arguments:
                article
              );
            },
            child: CachedNetworkImage(
              imageUrl: article.urlToImage,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(article.source.name,style: TextStyle(fontSize: 10,color: Color(0xff79828B),),),
          Text(article.title,style: TextStyle(fontSize: 14,fontWeight:FontWeight.w600)),
         Text(article.publishedAt,style: TextStyle(fontSize: 10,color: Color(0xff79828B),),textAlign: TextAlign.end)
        ],
      ),
    );
  }
}
