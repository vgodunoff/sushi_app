import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sushi_app/screens/cart.dart';
import 'package:sushi_app/screens/my_orders.dart';
import 'package:sushi_app/screens/roll.dart';
import 'package:sushi_app/screens/sets_screen.dart';
import 'package:sushi_app/screens/settings.dart';
import 'package:sushi_app/widgets/bottomNavBar.dart';

import 'icons/custom_icon_icons.dart';
import 'icons/trolley_cart_icons.dart';

class DashboardScreen extends StatefulWidget {
  // Widget page;
  // DashboardScreen({this.page});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> _widgetOptions = <Widget>[
    SetsScreen(),
    Cart(),
    MyOrders(),
    Settings(),
  ];

  int _currentSelected = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void _onItemTapped(int index) {
    setState(() {
      _currentSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: MyDrawer(context),
      body: _widgetOptions.elementAt(_currentSelected),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _currentSelected,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(TrolleyCart.trolley),
            label: 'Мои заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }

  Container MyDrawer(BuildContext context) {
    return Container(
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            InkWell(
                              child: Icon(
                                CustomIcon.set_icon,
                                size: 35,
                              ),
                              onTap: () {
                                changeFirstPage(SetsScreen());
                              },
                            ),
                            Text('')
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Container(
                            child: SvgPicture.asset('images/maki.svg'),
                            height: 35.0,
                          ),
                          onTap: () {
                            changeFirstPage(Rolls());
                          },
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
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void changeFirstPage(Widget page) {
    setState(() {
      _widgetOptions.removeAt(0);
      _widgetOptions.insert(0, page);
    });
  }
}
