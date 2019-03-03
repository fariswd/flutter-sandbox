import 'package:flutter/material.dart';
import '../component/CardList.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card and Parsing'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CardList(
              cardTitle: 'home',
              cardIcon: Icons.home,
              cardColor: Colors.blue,
              routeName: '/home',
            ),
            CardList(
              cardTitle: 'person',
              cardIcon: Icons.person,
              cardColor: Colors.grey,
              routeName: '/person',
            ),
            CardList(
              cardTitle: 'key',
              cardIcon: Icons.vpn_key,
              cardColor: Colors.greenAccent,
              routeName: '/key',
            ),
          ],
        ),
      ),
    );
  }
}
