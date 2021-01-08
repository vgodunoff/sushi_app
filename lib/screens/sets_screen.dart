import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_app/screens/cart.dart';
import 'package:sushi_app/widgets/bottomNavBar.dart';
import 'file:///D:/projects/sushi_app/lib/icons/custom_icon_icons.dart';
import 'package:sushi_app/widgets/logo_screen.dart';
import 'file:///D:/projects/sushi_app/lib/icons/trolley_cart_icons.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../bottomNavIndex.dart';

class SetsScreen extends StatefulWidget {
  static const routeName = '/setsScreen';

  const SetsScreen({
    Key key,
  }) : super(key: key);

  @override
  _SetsScreenState createState() => _SetsScreenState();
}

class _SetsScreenState extends State<SetsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  //get getBottomNavIndex => null;
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    return Scaffold(
      appBar: AppBar(),
      key: _scaffoldKey1,
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

    // Within your widgets:
    // Image.network(downloadURL);
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
