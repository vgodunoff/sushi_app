import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottomNavIndex.dart';
import '../widgets/bottomNavBar.dart';

class Cart extends StatefulWidget {
  static const routeName = '/cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _scaffoldKey2 = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final BottomNavIndex args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey2,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Корзина'),
        actions: [
          TextButton(
            child: Text(
              'Очистить',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: SvgPicture.asset(
            'images/add-to-cart.svg',
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
      ),
      bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Итого",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Text(
                      "0.00 тг.",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Оплатить',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.red,
                ),
              )
            ],
          )),
    );
  }
}
