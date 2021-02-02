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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Настройки'),
      ),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            title: Text('Войти в профиль'),
            trailing: InkWell(
              child: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('ОСНОВНАЯ ИНФОРМАЦИЯ'),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('О нас'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1.5,
            indent: 100,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('Написать нам'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 2,
            indent: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('СОЦИАЛЬНЫЕ СЕТИ'),
          ),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1.5,
            indent: 100,
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            title: Text('Instagram'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1.5,
            indent: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text('Войти как администратор'),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    cursorColor: Colors.red,
                    style: TextStyle(color: Colors.red),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    cursorColor: Colors.red,
                    style: TextStyle(color: Colors.red),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin');
                    },
                    child: Text('Admin'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
