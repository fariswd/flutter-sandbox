import 'package:flutter/material.dart';
import './screen/IndexScreen.dart';

import './screen/HomeScreen.dart';
import './screen/PersonScreen.dart';
import './screen/KeyScreen.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sanbox',
      home: IndexScreen(),
      routes: <String, WidgetBuilder>{
        '/home' : (BuildContext context) => HomeScreen(appbar: true,),
        '/person' : (BuildContext context) => PersonScreen(appbar: true,),
        '/key' : (BuildContext context) => KeyScreen(appbar: true,),
      },
    );
  }
}
