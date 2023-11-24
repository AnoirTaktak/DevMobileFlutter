import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalerieDetailsPage extends StatefulWidget {


  String keyword = '';
  GalerieDetailsPage(this.keyword);

  @override
  State<GalerieDetailsPage> createState() => _GalerieDetailsPageState();
}

class _GalerieDetailsPageState extends State<GalerieDetailsPage> {
  var galerieData ;
  int curentPage = 1;
  int size = 10;
  late int totalPages ;
  ScrollController _scrollController = new ScrollController();
  List<dynamic> hits = [];

  @override
  void initState(){
    super.initState();
    getGalerieData(widget.keyword);
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(curentPage<totalPages){
          curentPage++;
          getGalerieData(widget.keyword);
        }
      }
    });
  }

  void getGalerieData(String keyword) {
    print("Galerie de " + keyword);
    String url = "https://pixabay.com/api/videos/?key=39494486-94b1811e0cdf43e65bf6499bc&q=${keyword}&page=${curentPage}&perPage=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.galerieData = jsonDecode(resp.body);
        hits.addAll(galerieData['hits']);
        totalPages =(galerieData['totalHits']/size).ceil();
        hits = galerieData["hits"];
        print(this.galerieData);
      });

    }).catchError((err) {
      print(err);
    }
    );
    


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: totalPages==0 ? Text('Pas de resultats') : Text(" ${widget.keyword} , Page ${curentPage} / ${totalPages}"),),
      body: (galerieData == null ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: (galerieData == null ? 0 : hits.length),
          controller: _scrollController,
          itemBuilder: (context,index){
            return Column(
            children: [
              Container(
                child: Card(
                  child:

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text(hits[index]['tags'],style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ), color: Colors.blue,

                ),
                padding: EdgeInsets.only(right: 10,left: 10),
                width: double.infinity,
              ),
              Container(
                child: Card(
                child:
                  Image.network(hits[index]["userImageURL"],fit: BoxFit.fitWidth,),
                ),
                padding: EdgeInsets.only(left: 10,right: 10),
              )
            ],
            );
    },
    )));
  }
  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }
}
