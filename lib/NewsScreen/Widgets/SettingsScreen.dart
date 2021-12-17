import 'package:flutter/material.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/SideMenu.dart';
import 'package:news_app_back_on_track/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_back_on_track/model/providers/LocalizationsProvider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static final ROUTE_NAME = "SettingsScreen";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropdownValue = "English";

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<LocalizationsProvider>(context);
     return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80))),
            backgroundColor: MyThemeData.primaryColor,
            title: Text(AppLocalizations.of(context).settings),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pattern.png"),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context).language,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: MyThemeData.primaryColor)
                  ),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(8),
                  child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const  Icon(Icons.arrow_downward),
                      elevation: 16,
                      isExpanded: true,
                      style: const TextStyle(color: Color(0xff39A552)),
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          provider.changeLanguage(newValue);

                        });
                      },
                      items: <String>['English', 'Arabic']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value))
                        ;
                      }).toList(),
                    ),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: MyThemeData.primaryColor,),
                //   ),
                //   child: Row(
                //     children: [
                //       Text(data)
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        );

  }
}
