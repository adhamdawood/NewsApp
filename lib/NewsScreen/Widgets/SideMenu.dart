import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/SettingsScreen.dart';
import 'package:news_app_back_on_track/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatelessWidget {
  Function onDrawerCategoryClick;
  SideMenu({this.onDrawerCategoryClick});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width*.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
            ),
            child: Center(child: Text(AppLocalizations.of(context).newsApp,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight : FontWeight.bold),))
            ,),
           IconButton(
                onPressed: (){
                  onDrawerCategoryClick();
                  Navigator.pop(context);
                },
                icon: Row(
              children: [
                Icon(Icons.list,color: Colors.black,),
                SizedBox(width: 8,),
                Text(AppLocalizations.of(context).categories,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              ],
            )),
          IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(SettingsScreen.ROUTE_NAME);
              },
              icon: Row(
            children: [
              Icon(Icons.settings,color: Colors.black,),
              SizedBox(width: 8,),
              Text(AppLocalizations.of(context).settings,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            ],
          ))


        ],
      ),
    );
  }
}
