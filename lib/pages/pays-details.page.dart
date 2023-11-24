import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';



class PaysDetailsPage extends StatefulWidget {
  String pays ="";
  PaysDetailsPage(this.pays);

  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  var paysData;
  @override
  void initState(){
    super.initState();
    getPaysData(widget.pays);
  }

  void getPaysData(String pays){
    print("Pays details " + pays);
    String url =
        "https://restcountries.com/v2/name/${pays}";
    http.get(Uri.parse(url)).then((resp){
      setState(() {
        this.paysData = json.decode(utf8.decode(resp.bodyBytes));
        print(this.paysData);
        print(paysData[0]['flags']["png"]);
        print(paysData[0]['name']);
        print(paysData[0]["translations"]['fa']);
        print(paysData[0]['capital']);
        print(paysData[0]['languages'][0]['name'][0]);
        print(paysData[0]['languages'][0]['nativeName'][0]);
        print(paysData[0]['region']);
        print(paysData[0]['area'].toString());
        print(paysData[0]['timezones'][0]);
        print(paysData[0]['population'].toString());
      });

    }).catchError((err){print(err);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Page Pays Details ${widget.pays}'),),
      body: paysData == null ? Center(child: CircularProgressIndicator()) :
          
      Center(

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(

            children: [

              Column(
                mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Image(
                        image: NetworkImage(paysData[0]['flags']["png"]),


                    ),

                    Column(
                      children: [
                        Text(paysData[0]['name']),
                        SizedBox(),
                        Text(paysData[0]["translations"]['fa'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Administration : ",style: TextStyle(color: Colors.blue,fontSize: 32),),

                        Row(
                          children: [
                            Text("Capital : ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['capital'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(),
                        Row(
                          children: [
                            Text("Langue : ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['languages'][0]['name'][0],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['languages'][0]['nativeName'][0],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ],
                        )

                      ],
                    ),
                    Column(
                      children: [
                        Text("Geographie : ",style: TextStyle(color: Colors.blue,fontSize: 32),),
                        Row(
                          children: [
                            Text("Region : ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['region'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(),
                        Row(
                          children: [
                            Text("Surface : ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['area'].toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(),
                        Row(
                          children: [
                            Text("Fuseau Horaire : ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['timezones'][0],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],

                    ),
                    Column(
                      children: [
                        Text("Demographie : " ,style: TextStyle(color: Colors.blue,fontSize: 32),),
                        Row(
                          children: [
                            Text("Population : ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text(paysData[0]['population'].toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    )
                  ]
              ),



            ],

          ),
        ),
      ),
      

    );
    
  }
}
