import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'ajout_modif_contact.dart';
import 'package:voyage/menu/drawer.widget.dart';


class ContactsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Contacts")),
      body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FormHelper.submitButton('Ajout',
                    (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AjoutModifContactPage() ));
                    },
                    borderRadius: 10,
                  btnColor: Colors.blue,
                  borderColor: Colors.blue,
                ),
              )
            ],
          )

      ),
    );
  }


}


