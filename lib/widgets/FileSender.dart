import 'dart:io';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guester/models/message.model.dart';
import 'dart:developer' as developer;
import 'package:image_picker_modern/image_picker_modern.dart';

class FileSender extends StatefulWidget {
  @override
  _FileSenderState createState() => _FileSenderState();
}

class _FileSenderState extends State<FileSender> {

  Future _uploadImage() async {
    developer.log("Hello");

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    var timestamp = DateTime.now().millisecondsSinceEpoch;

    // StorageReference storageReference = FirebaseStorage.instance.ref()
    //   .child("img_" + timestamp.toString() + ".jpg");

    // StorageUploadTask uploadTask = storageReference.put(imageFile);
    // Uri fileUrl = await uploadTask.downloadUrl;

     // var thread = await FirebaseDatabase.instance.reference()
    //   .child("channels")
    //   .child("practical-software-engineer")
    //   .push();

    // thread.set({
    //   "fileUrl": fileUrl,
    //   "type": "image",
    //   "timestamp": timestamp,
    //   "love": 0,
    //   "userid": currentUser.id,
    //   "firstname": currentUser.firstname,
    //   "lastname": currentUser.lastname,
    //   "avatar": currentUser.avatar
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 120,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 50, right: 50),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.picture_as_pdf),
            )
          ),
          GestureDetector(
            onTap: () { _uploadImage(); },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.photo),
            )
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.photo_camera),
            )
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.record_voice_over),
            )
          ),
        ],
      ),
    );
  }
}