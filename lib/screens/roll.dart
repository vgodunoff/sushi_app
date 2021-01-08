import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_app/screens/cart.dart';
import 'package:sushi_app/widgets/logo_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Rolls extends StatefulWidget {
  static const routeName = '/rolls';

  const Rolls({
    Key key,
  }) : super(key: key);

  @override
  _RollsState createState() => _RollsState();
}

class _RollsState extends State<Rolls> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    return Scaffold(
      appBar: AppBar(
        title: Text('Rolls'),
      ),
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
    return FutureBuilder<QuerySnapshot>(
      future: rollSet.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List dataFromDoc = snapshot.data.docs;
          print(dataFromDoc);

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataFromDoc.length,
            itemBuilder: (context, index) {
              // print(dataFromDoc[index]);
              // print(dataFromDoc[index]['name']);
              // print(dataFromDoc[index]['price']);
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/godunoff-sushi-app.appspot.com/o/photos%2F5.jpg?alt=media&token=41328b98-9925-433c-8bd9-f9a03d04aa40'),
                  radius: 100.0,
                ),
                title: Text(dataFromDoc[index]['name']),
              );
            },
          );
        }
      },
    );
  }
}
