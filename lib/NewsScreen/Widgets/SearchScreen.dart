import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/main.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static final ROUTE_NAME = "SearchScreen";
  Function onSearchButtonClick;
  SearchScreen({this.onSearchButtonClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(80),bottomRight: Radius.circular(80))
              ),
              backgroundColor: MyThemeData.primaryColor,
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),color: Colors.white
                ),
                child: Center(
                  child: TextField(
                    onChanged: (String qInTitle){
                      onSearchButtonClick(qInTitle);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            /* Clear the search field */
                          },
                        ),
                        hintText: 'Search...',
                        border: InputBorder.none),
                  ),),
              ) ,
            ),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pattern.png"),
                      fit: BoxFit.cover)),)
        );
    //
  }
}
