import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_app/screens/cart.dart';
import 'package:sushi_app/widgets/bottomNavBar.dart';
import 'file:///D:/projects/sushi_app/lib/icons/custom_icon_icons.dart';
import 'package:sushi_app/widgets/logo_screen.dart';
import 'file:///D:/projects/sushi_app/lib/icons/trolley_cart_icons.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SetsScreen extends StatefulWidget {
  const SetsScreen({
    Key key,
  }) : super(key: key);

  @override
  _SetsScreenState createState() => _SetsScreenState();
}

class _SetsScreenState extends State<SetsScreen> {
  int _currentIndex = 0;
  final tabs = [
    Rollset(),
    Cart(),
  ];

  //get getBottomNavIndex => null;
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference rollSet =
        FirebaseFirestore.instance.collection('rollset');

    return Scaffold(
      appBar: AppBar(),
      drawer: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ListView(
              children: [
                Wrap(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Icon(
                                    CustomIcon.set_icon,
                                    size: 50,
                                  ),
                                  Text('')
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 50,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            right: -50,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
              ),
            ),
          )
        ],
      ),
      body: Text(BottomNavBar().getBottomNavIndex.toString()),
      bottomNavigationBar: BottomNavBar(),
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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('rollset').snapshots(),
      builder: (ctx, streamSnapshot) {
        if (streamSnapshot.data.docs == null) {
          return Logo();
        }
        final listDoc = streamSnapshot.data.docs;

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listDoc.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/godunoff-sushi-app.appspot.com/o/photos%2F5.jpg?alt=media&token=41328b98-9925-433c-8bd9-f9a03d04aa40'),
                radius: 100.0,
              ),
              title: Text(listDoc[index]['name']),
            );
          },
        );
      },
    );
  }
}
