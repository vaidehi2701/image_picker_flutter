import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  File image;

 final toast = Fluttertoast.showToast(
  msg: "Hurray !!!! Image Is Selected",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIos: 1,
  backgroundColor: Colors.red,
  textColor: Colors.white,
  fontSize: 16.0
  );

  ChooseGallery()async{
    print('picker is called');
    File img =await ImagePicker.pickImage(source: ImageSource.gallery);
    if(img != null){
      print(img.path);
      setState(() {
        image=img;
      });
      toast;
    }
  }
  ChooseCamera()async{
    print('picker is called');
    File img =await ImagePicker.pickImage(source: ImageSource.camera);
    if(img != null){
      print(img.path);
      setState(() {
        image=img;
      });
      toast;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Select Image From',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              fontSize: 20
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: ChooseGallery,
                      icon: Icon(Icons.image),
                        ),
                    Text('Gallery')
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: ChooseCamera,
                      icon: Icon(Icons.camera_alt),
                    ),
                    Text('Camera')
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              decoration: BoxDecoration(
//                border: Border.all(
//                  width: 1
//                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [ BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 2.0,
                  ),]
              ),
              width: 350,
              height: 350,
              child: image == null ? Text('no image') : Image.file(image),
            ),
          )

        ],
      ),
    );
  }
}
