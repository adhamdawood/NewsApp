import 'package:flutter/material.dart';

class LocalizationsProvider extends   ChangeNotifier{
  String language ="en";



  void changeLanguage(value){
    language=value=="English"?"en":"ar";
    notifyListeners();
}
}