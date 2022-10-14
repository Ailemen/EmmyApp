

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zigzag/main.dart';
import 'package:zigzag/picture.dart';


class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  State<list> createState() => _listState();
}


class _listState extends State<list> {

  @override

  String ?url;
   final CollectionReference data = FirebaseFirestore.instance.collection('info');

  Widget build(BuildContext context) {

    return  Scaffold(body:
    Column(
      children: [
        Container(height: 527,width: 438, color: Colors.green.shade400,
          child: StreamBuilder(
              stream:  data.snapshots(),
              builder: (context,
              AsyncSnapshot<QuerySnapshot?>StreamSnapshot)
          {    if(StreamSnapshot.hasData){

            return

            ListView.builder(
              itemCount: StreamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                String ant ='N';
                 final DocumentSnapshot documentSnapshot
                 = StreamSnapshot.data!.docs[index];
                 Color  love = Colors.red;
                 Color  lover = Colors.white;
                 Color  lov = lover;

            return   Column(
              children: [

                SizedBox(height: 22,),
                Container( height: 111,width: 333,
                  child: ListView(
                  scrollDirection: Axis.horizontal
                  ,children: [
                    SizedBox(width: 5,),
                    MaterialButton(onPressed: (){}
                    ,child:   Text('Hostels',style: TextStyle(
                          color: Colors.white
                          ,fontSize: 11,fontWeight:
                  FontWeight.bold),),)
                  ,  SizedBox(width: 5,),
                    MaterialButton(onPressed: (){}
                      ,child:   Text('Roomate',style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,fontWeight:
                      FontWeight.bold),),)
                   , SizedBox(width: 5,),
                    MaterialButton(onPressed: (){}
                      ,child:   Text('Market',style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,fontWeight:
                      FontWeight.bold),),)
                  , SizedBox(width: 5,),
                    MaterialButton(onPressed: (){}
                      ,child:   Text('Service',style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,fontWeight:
                      FontWeight.bold),),)


                  ],),
                ),
                SizedBox(height: 15,),

               Card(child: ListTile(title: Container(
                 height: 444,width: 333,
                 child: Column(children: [
                   SizedBox(height: 55,),
                   Row(
                     children: [
                       SizedBox(width: 111,),
                       ClipRRect(
                           borderRadius: BorderRadius.circular(13)
                           ,child: Expanded(
                             child: Center(
                               child: Row(
                                 children: [
                                   SizedBox(width:11,),
                                   Text('Price :',style: TextStyle(fontSize: 19,fontWeight:
                                   FontWeight.bold), ),
                                   SizedBox(width: 4,),
                                   Text('N',style: TextStyle(fontSize: 19,fontWeight:
                                   FontWeight.bold), ),

                                   SizedBox(width: 1,),
                                   Text(documentSnapshot['price'].toString() ,
                                     style: TextStyle(fontSize: 19,fontWeight:
                                     FontWeight.bold),
                                   ),
                                 ],
                               ),
                             ),
                           )),

                     ],
                   ),
                   SizedBox(width: 22,),
                   ClipRRect(
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(13),
                       child: Container(height: 233,width: 344, color:Colors.white,
                         child: ListView(
                           scrollDirection: Axis.horizontal,
                          children :[ Container(height: 222,width: 299,
                           color: Colors.grey,
                          child: Image(
                              fit: BoxFit.cover
                              ,
                              image: NetworkImage(documentSnapshot['url'])),),
                           SizedBox(width: 11,),
                            ClipRRect(
                              child: Container(height: 222,width: 299,
                                color: Colors.grey,
                                child: Image(
                                    fit: BoxFit.cover
                                    ,
                                    image: NetworkImage(documentSnapshot['urll'])),
                              ),
                            ),
                            SizedBox(width: 11,),
                            ClipRRect(
                              child: Container(height: 222,width: 299,
                                color: Colors.grey,

                                child: Image(
                                    fit: BoxFit.cover
                                    ,image: NetworkImage(documentSnapshot['urlll'])),
                              ),
                            ),
                          ]
                         ),
                       ),
                     ),
                   ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child:Container( color:  Colors.green.shade300,
                        child: Container(child: Column(
                          children: [
                            Row(children: [
                              SizedBox(width: 6,),
                              Text(documentSnapshot['name'] ),
                              SizedBox(width: 66,),
                     Row(
                                children: [
                                  Text(documentSnapshot['distance'].toString() ,
                                    style: TextStyle(fontSize: 19,fontWeight:
                                    FontWeight.bold),),

                                  SizedBox(width: 4,),
                                  Text('munite walk \nfrom back gate'
              ,  style: TextStyle(fontSize: 11,fontWeight:
                FontWeight.bold,color: Colors.white),
                                  ),


                                ],
                              ),],),
                            SizedBox(height: 7,),
                            Text('Contact')
                          ],
                        ),),
                      ),
                    )

               ],),),),),

              ],
            );
          });} else{  return Container();}

          }),
        )

          ,SizedBox(height: 22,)        ,Container(height: 55,width:411
          ,color:  Colors.green.shade400,child: Row(children: [ SizedBox(width: 51,),
            Icon(Icons.house,color: Colors.white,size: 39,),SizedBox(width: 57,),
            ClipRRect(borderRadius: BorderRadius.circular(44),
              child: MaterialButton(    elevation: 44,onPressed: () async{

                final ImagePicker picker= ImagePicker();
                final imgee= await picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  picture = imgee;
                });
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>pic()));

              },
                height: 33,minWidth: 55,color: Colors.white,
                child: Icon(Icons.add,color: Colors.green.shade400,size: 39,),),
            ),SizedBox(width: 57),
            Icon(Icons.refresh,color: Colors.white,size: 39,)
          ],),)
      ],
    ));

  }
}
