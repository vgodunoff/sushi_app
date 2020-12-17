import 'package:flutter/material.dart';
import 'package:sushi_app/widgets/bottomNavBar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Мои заказы'),
      ),
      body: ListView(
        children: [
          ExpansionTileCard(
            expandedColor: Colors.grey,
            title: Text('2020-03-08'),
            subtitle: Text('4004,0 тг.'),
            trailing: Column(
              children: [
                Icon(Icons.refresh),
                Text('Заказать'),
              ],
            ),
            children: [
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Сет Икигай Акция'),
                      Text('3999,0 тг.'),
                    ],
                  ),
                  Text('Кол: 1'),
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

// ExpansionTile(
// backgroundColor: Colors.greenAccent,
// title: Text('2020-03-08'),
// subtitle: Text('4004,0 тг.'),
// trailing: Column(
//   children: [
//     Icon(Icons.refresh),
//     Text('Заказать'),
//   ],
// ),
// children: [
// Divider(),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// children: [
// Text('Сет Икигай Акция'),
// Text('3999,0 тг.'),
// ],
// ),
// Text('Кол: 1'),
// ],
// ),
// ],
// )
