import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:voyage/pages/contacts.page.dart';
import 'package:voyage/pages/galerie.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/auth.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/pays.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'config/global.params.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


ThemeData theme = ThemeData.light();
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GlobalParams.themeActuel.setMode(await _onGetMode());
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = {
    '/home' : (context)=>HomePage(),
    '/inscription' : (context)=>InscrptionPage(),
    '/auth' : (context)=>AuthPage(),
    '/meteo' : (context)=>MeteoPage(),
    '/contacts' : (context)=>ContactsPage(),
    '/galerie' : (context)=>GaleriePage(),
    '/parametres' : (context)=>ParametrePage(),
    '/pays' : (context)=>PaysPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: GlobalParams.themeActuel.getTheme(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData)
            return HomePage();
          else
            return AuthPage();
        },
      )
    );
  }
  @override
  void initState(){
    super.initState();
    GlobalParams.themeActuel.addListener(() {setState(){}});
  }
}



Future<String> _onGetMode() async {
  final snapshot = await ref.child('mode').get();
  if (snapshot.exists)
    mode = snapshot.value.toString();
  else
    mode = 'jour';
  print(mode);
  return(mode);
}
