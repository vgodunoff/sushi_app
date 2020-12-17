import 'package:flutter/material.dart';
import 'package:sushi_app/icons/trolley_cart_icons.dart';
import 'package:sushi_app/screens/my_orders.dart';
import 'package:sushi_app/screens/test_card.dart';
import '../screens/cart.dart';

class BottomNavBar extends StatefulWidget {
  static int _bottomNavIndex = 0;

  int get getBottomNavIndex {
    return BottomNavBar._bottomNavIndex;
  }

  @override
  _BottomNavBarState createState() => _BottomNavBarState();

  void setBottomNavIndex(int index) {
    BottomNavBar._bottomNavIndex = index;
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.getBottomNavIndex,
      onTap: (index) {
        setState(() {
          widget.setBottomNavIndex(index);
        });
        print(BottomNavBar().getBottomNavIndex);
      },
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.lightBlueAccent,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Меню',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(Icons.shopping_cart_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Cart();
                }),
              );
            },
          ),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              child: Icon(TrolleyCart.trolley),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }),
                );
              }),
          label: 'Мои заказы',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Настройки',
        ),
      ],
    );
  }
}
