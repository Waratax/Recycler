import 'package:flutter/material.dart';
import 'screens/mainScreen.dart';

void main() {
  runApp(MyApp());
}

Map<String, WidgetBuilder> phoneRoutes = {
  '/mainScreen': (context) => MainScreen(),
};

String phoneHomeRoutes = '/mainScreen';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycler',
      initialRoute: phoneHomeRoutes,
      routes: phoneRoutes,
    );
  }
}
