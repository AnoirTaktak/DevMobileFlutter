import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {

  late SharedPreferences prefs;
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page d'authentification")),
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
                    minimumSize: const Size.fromHeight(50)
                ),
                onPressed: (){
                  onAuthentifier(context);
                }, child: Text('Connexion',style: TextStyle(fontSize: 22),),
              )
          ),
          TextButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/inscription');
          }, child: Text("j'ai pas un compte",style: TextStyle(fontSize: 22)))

        ],
      )
    );
  }
  Future<void> onAuthentifier (BuildContext context) async {
    SnackBar snackBar = SnackBar(content: Text(""));
    if(txt_password.text.isEmpty && txt_login.text.isEmpty){
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: txt_login.text.trim(), password: txt_password.text.trim());
        Navigator.pop(context);
        Navigator.pushNamed(context, "/home");
      } on FirebaseAuthException catch (e) {
        if(e.code == 'user-not-found'){
          snackBar = SnackBar(content: Text('verifier votre mot de passe'));

        }
      } catch (e) {
        print(e);
      }

    } else {
      snackBar = SnackBar(content: Text('Id ou mot de passe invalide'));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
