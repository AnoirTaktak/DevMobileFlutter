import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/pays-details.page.dart';



class PaysPage extends StatelessWidget {

  TextEditingController txt_pays = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Pays")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_pays,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city_outlined),
                  hintText: "Pays",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)
              ),
              onPressed: () {
                OnGetPaysDetails(context);
              }, child: Text('Chercher', style: TextStyle(fontSize: 22),),
            ),
          )
        ],

      ),
    );
  }

  void OnGetPaysDetails(BuildContext context) {
    String v = txt_pays.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaysDetailsPage(v) ));
    txt_pays.text = "";
  }
}

