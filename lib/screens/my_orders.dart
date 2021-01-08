import 'package:flutter/material.dart';
import 'package:sushi_app/widgets/bottomNavBar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

import '../bottomNavIndex.dart';

class MyOrders extends StatefulWidget {
  static const routeName = '/myOrders';
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final GlobalKey<ScaffoldState> _scaffoldKey3 = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final BottomNavIndex args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey3,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Мои заказы'),
      ),
      body: ListView(
        children: [
          // PreviousOrder(),
        ],
      ),
    );
  }
}
