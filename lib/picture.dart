import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:zigzag/list.dart';
import 'package:zigzag/main.dart';
import 'storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class pic extends StatefulWidget {
  const pic({Key? key}) : super(key: key);

  @override
  State<pic> createState() => _picState();
}

final CollectionReference data = FirebaseFirestore.instance.collection('info');
 final storeState stuff = storeState();
 String done ='';
XFile? picture;
File imgfile =   File(picture!.path);

int ne =1;
 int nu =1;
XFile? picturee;
File imgfilee =   File(picturee!.path);


XFile? pictureee;
  File imgfileee  =   File(pictureee!.path);




class _picState extends State<pic> {
  @override

  TextEditingController controller = TextEditingController();
  String ? get erro{
    final text =  controller.value.text;

    if(text.isEmpty){
      return '                        Name';}

    return null;
  }

var text ='';



  TextEditingController controlle = TextEditingController();
  String ? get err{
    final text =  controlle.value.text;

    if(text.isEmpty){
      return '                        Phone';}

    return null;
  }

  var tex ='';






  TextEditingController controll = TextEditingController();
  String ? get er{
    final text =  controll.value.text;

    if(text.isEmpty){
      return '                        Price';}

    return null;
  }

  var te ='';


  TextEditingController bcontroller = TextEditingController();
  String ? get berro{
    final text =  controller.value.text;

    if(text.isEmpty){
      return '                        Name';}

    return null;
  }

  var btext ='';





  Widget build(BuildContext context) {
     int teller =1;
   if(controller.value.text==null){
     setState(() {
         ++ teller;
     });
   }
    return  Scaffold(body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListView(
        children: [
        SizedBox(height: 38,),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container( height: 355,width: 444,child:
                MaterialButton(onPressed:() async{
                  final ImagePicker picker= ImagePicker();
                  final imge= await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    picture = imge;
                  });

                },
                  child: Image
                    (image: FileImage(File(imgfile.path ))),
                )
                ),
              ),
             SizedBox(width: 6,),

              Expanded(
                child: Container( 
                    
                height: 355,width: 444,child:MaterialButton(onPressed: () async{
                 ImagePicker picker= ImagePicker();
                  final imgee= await picker.pickImage(

                      source: ImageSource.gallery);
                    setState(()  {
                      picturee = imgee;
                      nu = 2;});
                  setState(() {
                  });

                },

                  child: nu == 1?
                  Image(image: AssetImage( 'pic/a.jpg' )):

                Image
                (image: FileImage(File(imgfilee.path))  )
                      ,
                )
                ),
              ),

              SizedBox(width: 1,),

              Expanded(
                child: Container( height: 355,width: 444,child:MaterialButton(
                  onPressed: () async{

                    final ImagePicker picker= ImagePicker();
                    final imgeee= await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                    pictureee = imgeee;


                      ne = 2;});

                    setState(() {
                    });
                  },
                  child:  ne == 1 ?
                 Image(image: AssetImage('pic/a.jpg')) :
                Image
                  (image: FileImage(File(imgfileee.path))  )
              ,
                )
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 11,),
          Expanded(
            child: TextFormField(onChanged:  (text) =>  setState(() {

            }) ,
              decoration: InputDecoration(
                fillColor:  Colors.greenAccent,
                  errorText: erro,
               border:  OutlineInputBorder()
               //   labelText: ' Add Caption'
              ),
              controller: controller,),
          ),
  SizedBox(height: 8,),

          Expanded(
            child: TextFormField(onChanged:  (text) =>  setState(() {

            }) ,
              decoration: InputDecoration(
                  fillColor:  Colors.greenAccent,
                  errorText: er,
                  border:  OutlineInputBorder()
                //   labelText: ' Add Caption'
              ),
              controller: controll,),
          ),

          SizedBox(height: 8,),
          Expanded(
            child: TextFormField(onChanged:  (text) =>  setState(() {

            }) ,
              decoration: InputDecoration(
                  fillColor:  Colors.greenAccent,
                  errorText: err,
                  border:  OutlineInputBorder()
                //   labelText: ' Add Caption'
              ),
              controller: controlle,),
          ),
  ClipRRect(borderRadius: BorderRadius.circular(27),
      child: MaterialButton(
        color: Colors.green.shade400,
          minWidth: 266,
          onPressed:controller.value
                .text.isEmpty ==true ?null : () async{

            setState(() async{
       storeState().upload();
     done = 'Upload Successfull';
       data.add({'name' : controller.text,'price':controll.text,'distance': controlle.text});
            });


          }, child: Text('Upload'
          ,style: TextStyle(
          color: Colors.white,
          fontSize: 11,fontWeight:
          FontWeight.bold),
      )),
  )

      ],),
    ) );
  }
}
