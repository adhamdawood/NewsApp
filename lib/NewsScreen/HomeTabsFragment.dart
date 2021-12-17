import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/NewsScreen/NewsList.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/TabItem.dart';
import 'package:news_app_back_on_track/model/APIs/sources_response.dart';

class HomeTabsFragment extends StatefulWidget {
  List<Sources> sources;
   HomeTabsFragment(this.sources);
  @override
  _HomeTabsFragmentState createState() => _HomeTabsFragmentState();
}

class _HomeTabsFragmentState extends State<HomeTabsFragment> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.sources.length,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: TabBar(
                onTap: (index){
                  setState(() {
                    selectedIndex=index;
                  });
                },
                isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: widget.sources.map((source) => TabItem(source, widget.sources.indexOf(source)==selectedIndex)).toList()),
            ),
               Expanded(
                 child: TabBarView(
                     children: widget.sources.map((source) => NewsList(source)).toList(),
                     ),
               )
          ],
        ));
  }
}
