import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_back_on_track/CategoriesFragments/CategoriesFragment.dart';
import 'package:news_app_back_on_track/NewsScreen/HomeTabsFragment.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/SearchScreen.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/SideMenu.dart';
import 'package:news_app_back_on_track/main.dart';
import 'package:news_app_back_on_track/model/APIs/sources_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class NewsApp extends StatefulWidget {
  static final ROUTE_NAME="Home";
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<SourcesResponse> sourceResponse;
  String selectedCategory;
  SearchBar searchBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(onDrawerCategoryClick:onDrawerCategoryClick),
      appBar: AppBar(toolbarHeight: 80,
            backgroundColor: MyThemeData.primaryColor,
            shape: ContinuousRectangleBorder(
             borderRadius: BorderRadius.only(bottomLeft:Radius.circular(80),bottomRight: Radius.circular(80))
       ),
        title: Text(AppLocalizations.of(context).newsApp),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchScreen())),
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/pattern.png"),
                fit: BoxFit.cover)),
        child: selectedCategory==null?CategoriesFragment(onCategoryButtonClick):
         FutureBuilder<SourcesResponse>
          (future: sourceResponse,
            builder: (buildContext,snapShot){
               if(snapShot.hasError){
              return Text(snapShot.error.toString());
             }else if (snapShot.hasData){
              return snapShot.hasData?HomeTabsFragment(snapShot.data.sources)
              :CircularProgressIndicator();
            } else{
              return Center(child: CircularProgressIndicator());
            }
        }),
      ),
    );
  }

  void onDrawerCategoryClick(){
    setState(() {
      selectedCategory=null;
    });
  }
  void onCategoryButtonClick(String category){
    setState(() {
      selectedCategory=category;
      sourceResponse=loadSources();
    });
  }

  Future<SourcesResponse>loadSources() async{
    Uri uri = Uri.https("newsapi.org","/v2/top-headlines/sources",{
      'apiKey':'e1ebda0a37234980b1579caf2edaf629',
      'category': selectedCategory,
    });
    final response = await http.get(uri);
    if(response.statusCode==200){
      return SourcesResponse.fromJson(jsonDecode(response.body));
    }else{
      throw(Exception(response.body));
    }
}
  }
