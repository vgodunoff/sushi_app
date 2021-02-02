import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Admin extends StatefulWidget {
  static const routeName = '/admin';

  const Admin({
    Key key,
  }) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Страница редактирования'),
      ),
      body: Rollset(),
    );
  }
}

class Rollset extends StatelessWidget {
  const Rollset({
    Key key,
  }) : super(key: key);

  Future<String> downloadURLImage(String photo) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('rollset/$photo.jpg')
        .getDownloadURL();
    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference rollSet =
        FirebaseFirestore.instance.collection('rollset');
    return StreamBuilder<QuerySnapshot>(
      stream: rollSet.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['name']),
              subtitle: new Text(document.data()['price'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}
