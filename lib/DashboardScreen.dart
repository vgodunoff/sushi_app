import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  Widget page;
  DashboardScreen(this.page);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [widget.page,
      ],
    );
  }
}
