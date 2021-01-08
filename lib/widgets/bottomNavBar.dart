import 'package:flutter/material.dart';
import 'package:sushi_app/bottomNavIndex.dart';
import 'package:sushi_app/icons/trolley_cart_icons.dart';
import 'package:sushi_app/screens/my_orders.dart';
import 'package:sushi_app/screens/sets_screen.dart';
import '../screens/settings.dart';

import '../screens/cart.dart';

class BottomNavBar extends StatelessWidget {
  int _currentIndex;
  BottomNavBar(this._currentIndex);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.lightBlueAccent,
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(Icons.menu),
            onTap: () {
              Navigator.pushNamed(
                context,
                SetsScreen.routeName,
                arguments: BottomNavIndex(0),
              );
            },
          ),
          label: 'Меню',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(Icons.shopping_cart_outlined),
            onTap: () {
              Navigator.pushNamed(context, Cart.routeName,
                  arguments: BottomNavIndex(1));
            },
          ),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(TrolleyCart.trolley),
            onTap: () {
              Navigator.pushNamed(context, MyOrders.routeName,
                  arguments: BottomNavIndex(2));
            },
          ),
          label: 'Мои заказы',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(Icons.settings_outlined),
            onTap: () {
              Navigator.pushNamed(context, Settings.routeName,
                  arguments: BottomNavIndex(3));
            },
          ),
          label: 'Настройки',
        ),
      ],
    );
  }
}
