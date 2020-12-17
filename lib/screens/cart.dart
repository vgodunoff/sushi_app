import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottomNavBar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          child: SvgPicture.asset(
            'images/add-to-cart.svg',
            fit: BoxFit.scaleDown,
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
