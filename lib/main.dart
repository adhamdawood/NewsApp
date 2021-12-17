import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app_back_on_track/NewsScreen/NewsApp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_back_on_track/NewsScreen/NewsDetails.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/SearchScreen.dart';
import 'package:news_app_back_on_track/NewsScreen/Widgets/SettingsScreen.dart';
import 'package:news_app_back_on_track/model/providers/LocalizationsProvider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}
class MyThemeData{
  static final primaryColor=Color(0xff39A552);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocalizationsProvider>(
      create: (context)=> LocalizationsProvider(),
      builder: (context,widget){
        final provider =Provider.of<LocalizationsProvider>(context);

        return  MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''), // English, no country code
            Locale('ar', ''), // Arabic, no country code
          ],
          locale: Locale(provider.language,''),

          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: MyThemeData.primaryColor,
          ),
          routes: {
            NewsApp.ROUTE_NAME:(context)=>NewsApp(),
            SettingsScreen.ROUTE_NAME: (context)=>SettingsScreen(),
            SearchScreen.ROUTE_NAME:(context)=>SearchScreen(),
            NewsDetails.ROUTE_NAME:(context)=>NewsDetails(),
          },
          initialRoute: NewsApp.ROUTE_NAME,
        );
  },

    );
  }
}


