import 'package:flutter/material.dart';


class MonTheme extends ChangeNotifier{
  static String mode="jour";

  void setMode(String m){
    mode=m;
    notifyListeners();
  }

  ThemeData getTheme(){
    return (mode=="jour")? ThemeData.light() : ThemeData.dark();
  }
}