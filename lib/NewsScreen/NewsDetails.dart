import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_app_back_on_track/NewsScreen/NewsListScreen.dart';
import 'package:news_app_back_on_track/main.dart';
import 'package:news_app_back_on_track/model/APIs/articles_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetails extends StatefulWidget {
  static final ROUTE_NAME = "NewsDetails";

  @override
  _NewsDetailsState createState() => _NewsDetailsState();

}
class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: MyThemeData.primaryColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(80),bottomRight: Radius.circular(80))
        ),
        title: Text(AppLocalizations.of(context).moreDetails),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            width: double.infinity,
          imageUrl: args.urlToImage,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
          Text(args.source.id),
          Text(args.title,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(args.publishedAt,textAlign: TextAlign.end,),
          Text(args.description),
          Text(args.content),
          InkWell(
            onTap: (){
              _launchURL(args.url);
              },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children :[
              Text("View full article",style: TextStyle(fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_right,size: 20,),
            ]),
          )

        ],
        ),
      ),
    );

  }

  void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';

  }
}