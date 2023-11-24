import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';
import '../menu/drawer.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Page Home Hello My App")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("utilisateur : ${user?.email}",style: TextStyle(fontSize: 22)),

      ),

      Center(
        child: Wrap(
          children: [
            ...(GlobalParams.acceuil as List).map((item) {
              return InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: item['image'],
                ),
                onTap: () {
                  if('${item["route"]}' != '/auth') {
                    //Navigator.of(context).pop();
                    Navigator.pushNamed(context, "${item['route']}");
                  } else
                    Deconnexion(context);

                },
              );
            })
          ],
        ),
      ),
    ],
      )
    );
  }
  Future<void> Deconnexion (context) async {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/auth', (Route<dynamic> route) => false);
  }

  
}


