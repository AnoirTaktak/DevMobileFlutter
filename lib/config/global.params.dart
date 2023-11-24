import 'package:flutter/material.dart';
import 'package:voyage/notifier/theme.dart';

class GlobalParams{
  static List<Map<String,dynamic>> menus=[
    {"title":"Acceuil","icon":Icon(Icons.home,color: Colors.blue,),"route":"/home"},
    {"title":"Météo","icon":Icon(Icons.sunny_snowing,color: Colors.blue,),"route":"/meteo"},
    {"title":"Conctacts","icon":Icon(Icons.contact_page,color: Colors.blue,),"route":"/contacts"},
    {"title":"Galerie","icon":Icon(Icons.photo,color: Colors.blue,),"route":"/galerie"},
    {"title":"Parametres","icon":Icon(Icons.settings,color: Colors.blue,),"route":"/parametres"},
    {"title":"Pays","icon":Icon(Icons.location_city,color: Colors.blue,),"route":"/pays"},
    {"title":"Deconnexion","icon":Icon(Icons.logout,color: Colors.blue,),"route":"/auth"}
  ];
  static List<Map<String,dynamic>> acceuil=[
    {"image":AssetImage('images/meteo.png',),"route":"/meteo"},
    {"image":AssetImage('images/gallerie.png',),"route":"/galerie"},
    {"image":AssetImage('images/parametres.png',),"route":"/parametres"},
    {"image":AssetImage('images/pays.png',),"route":"/pays"},
    {"image":AssetImage('images/contact.png',),"route":"/contacts"},
    {"image":AssetImage('images/deconnexion.png',),"route":"/auth"},

  ];

  static MonTheme themeActuel=MonTheme();
}