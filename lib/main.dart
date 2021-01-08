import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:sushi_app/DashboardScreen.dart';
import 'package:sushi_app/screens/auth_screen.dart';
import 'package:sushi_app/screens/cart.dart';
import 'package:sushi_app/screens/my_orders.dart';
import 'package:sushi_app/screens/roll.dart';
import 'package:sushi_app/screens/sets_screen.dart';
import 'package:sushi_app/screens/settings.dart';
import 'package:sushi_app/widgets/logo_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.amber, // navigation bar color
    statusBarColor: Colors.red, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.red),
    ),
    routes: {
      SetsScreen.routeName: (context) => SetsScreen(),
      Rolls.routeName: (context) => Rolls(),
      Cart.routeName: (context) => Cart(),
      MyOrders.routeName: (context) => MyOrders(),
      Settings.routeName: (context) => Settings(),
    },
    home: App(),
  ));
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Text("Error");
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Logo();
    }

    return AuthScreen();
  }
}
