import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Авторизуйтесь'),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Введите Ваш номер телефона'),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Казахстан +7 ',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      cursorColor: Colors.red,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  'Вход',
                  style: TextStyle(color: Colors.white),
                ),
                minWidth: 370,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ],
          ),
        ));
  }
}
