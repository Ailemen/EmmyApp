import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zigzag/main.dart';

class ben extends StatefulWidget {

  @override
  State<ben> createState() => _benState();
}

class _benState extends State<ben> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Container( color: Colors.blue.shade900,child: Center(child:
    Column(
      children: [ SizedBox(height: 266,),
        Text('Not Connected !!!',style: TextStyle(fontSize: 22),),
        SizedBox(height: 88,),
        MaterialButton( minWidth: 44,height: 33,
            shape:  Border.all(width: 2,color: Colors.black)
            ,onPressed: (){

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>load()));

        }, child: Text('Retry'))
      ],
    ),)))); ;
  }
}
