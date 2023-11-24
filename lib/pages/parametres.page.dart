import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/config/global.params.dart';

String mode="jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

class ParametrePage extends StatefulWidget {


  @override
  State<ParametrePage> createState() => _ParametrePageState();
}

class _ParametrePageState extends State<ParametrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Parametres")),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('mode',style: TextStyle(fontSize: 22),),
            Column(
            children: <Widget>[
              ListTile(
                title: const Text('jour'),
                leading: Radio<String>(
                  value: "jour",
                  groupValue: mode,
                  onChanged: (value){
                    setState(() {
                      mode=value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("nuit"),
                leading: Radio<String>(
                  value: "nuit",
                  groupValue: mode,
                  onChanged: (value){
                    setState(() {
                      mode=value!;
                    });
                  },
                ),
              ),
            ],
          ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)
                ),
                onPressed: (){
                  _onSaveMode();
                },
                child: Text('Enregistrer',style: TextStyle(fontSize: 22))),
    ),
    ],
    )
    );
  }
  _onSaveMode() async{
    GlobalParams.themeActuel.setMode(mode);
    await ref.set({"mode":mode});
    print("mode appliqué $mode");
    Navigator.pop(context);
  }

}


