import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';

class InscrptionPage extends StatelessWidget {

  late SharedPreferences prefs;
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page d'inscription")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Utilisateur",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_password,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Mot de passe",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const ui.Size.fromHeight(50)
                ),
                  onPressed: (){
                    onInscrire(context);
                  }, child: Text('Inscription',style: TextStyle(fontSize: 22),),
            )
          ),
          TextButton(onPressed: () {
            Navigator.pop(context);
            //aaaaaaaaaaaaaaa
            Navigator.pushNamed(context, '/auth');
          }, child: Text("j'ai déja un compte",style: TextStyle(fontSize: 22)))
          
        ],
        

      ),
    );

  }
  Future<void>onInscrire(BuildContext context) async {
    SnackBar snackBar = SnackBar(content: Text(""));
    prefs = await SharedPreferences.getInstance();
    if(!txt_login.text.isEmpty && !txt_password.text.isEmpty){
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: txt_login.text.trim(), password: txt_password.text.trim());
        Navigator.pop(context);
        Navigator.pushNamed(context, "/home");
      } on FirebaseAuthException catch (e) {
        if(e.code == 'weak-password'){
          snackBar = SnackBar(content: Text('Mot de passe Faible'));

        }else if (e.code == 'email-already-in-use') {
          snackBar = SnackBar(content: Text("Email déja existant"));
        }
      }
    }else {
       snackBar = SnackBar(content: Text("verifier Votre ID et Mot de passe"));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
