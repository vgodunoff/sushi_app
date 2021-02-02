import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  Rollset({
    Key key,
  }) : super(key: key);

  String url = '';
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
            return Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(document.data()['imageUrl']),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    document.data()['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {}),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              SizedBox(
                                height: 45.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${document.data()['price'].toString()},00 тг.',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      onPressed: () {
                                        createDialog(context);
                                      },
                                      child: Row(
                                        children: [
                                          Text('Хочу'),
                                          Icon(Icons.add_shopping_cart)
                                        ],
                                      )),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                        ),
                        flex: 3,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  createDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
                'Чтобы добавить товар в корзину, пожалуйста авторизуйтесь'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'отмена'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                child: Text(
                  'ok'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          );
        });
  }
}
