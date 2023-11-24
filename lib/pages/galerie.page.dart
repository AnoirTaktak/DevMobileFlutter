import 'package:flutter/material.dart';
import 'galerie-details.page.dart';


class GaleriePage extends StatelessWidget {
  TextEditingController txt_galerie = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
        appBar: AppBar(title: Text("Galerie")),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_galerie,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.photo),
                    hintText: "keyword",
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
                onPressed: (){
                  OnGallerieDetails(context);
                }, child: Text('Chercher',style: TextStyle(fontSize: 22),),
              ),
            )
          ],
        )
    );
  }
void OnGallerieDetails(BuildContext context){
    String keyword = txt_galerie.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => GalerieDetailsPage(keyword)));
    txt_galerie.text = "";
}
}


