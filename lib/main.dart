import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zigzag/list.dart';
import 'package:zigzag/nativeone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zigzag/picture.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(mainscreen());
}

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,home: load());
  }
}



class load extends StatefulWidget {
  const load({Key? key}) : super(key: key);

  @override
  State<load> createState() => _loadState();
}

class _loadState extends State<load> {
  @override

  void san () async{

    await Future.delayed(Duration(seconds: 9));

    setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ben()));
    });
  }


  void mass()async{


    await FirebaseAuth.instance.signInAnonymously();
    await      FirebaseAuth.instance.signOut();
    Future.delayed(Duration(seconds: 2));

    print('welcome');


    setState(() {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>list()));
      // fat=rat;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    san();
    mass();

  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue.shade900,
      body: Center(child: CircularProgressIndicator(color: Colors.white,),),);
  }
}



