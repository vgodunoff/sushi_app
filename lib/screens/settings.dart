import 'package:flutter/material.dart';

import '../bottomNavIndex.dart';
import '../widgets/bottomNavBar.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final GlobalKey<ScaffoldState> _scaffoldKey4 = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final BottomNavIndex args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey4,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Настройки'),
      ),
      body: Center(),
    );
  }
}
