import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:zigzag/picture.dart';
import 'package:firebase_core/firebase_core.dart'as fire;
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference data = FirebaseFirestore.instance.collection('info');

class storeState  {
  FirebaseStorage storage = FirebaseStorage.instance;
 String bad ='';
  Future <void> upload () async{
try{
    await  storage.ref('test').putFile( imgfile).whenComplete(()async{
      await storage.ref('test').getDownloadURL().then((pic) {
           data.add({'url':pic});

      });
    });


    await  storage.ref('test').putFile( imgfilee).whenComplete(()async{
      await storage.ref('test').getDownloadURL().then((picc) {
        data.add({'urll':picc});

      });
    });



    await  storage.ref('test').putFile( imgfileee).whenComplete(()async{
      await storage.ref('test').getDownloadURL().then((piccc) {
        data.add({'urlll':piccc});

      });
    });


} on fire.
FirebaseException catch
  (e) { }
  }


  }

