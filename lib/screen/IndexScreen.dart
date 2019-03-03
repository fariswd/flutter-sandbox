import 'package:flutter/material.dart';
import '../screen/ProfileScreen.dart';

import '../screen/HomeScreen.dart';
import '../screen/PersonScreen.dart';
import '../screen/KeyScreen.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  static String title = 'Sakura chan';
  static String profileImage =
      'https://www.wowkeren.com/display/images/photo/2018/06/29/00214556.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homescreen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ProfileScreen(title: title, image: profileImage),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                ),
              ),
              accountName: Text(title),
              accountEmail: Text('sakura@mail.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/key');
              },
              leading: Icon(Icons.vpn_key),
              title: Text('Key'),
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: controller,
          children: <Widget>[
            HomeScreen(appbar: false),
            PersonScreen(appbar: false),
            KeyScreen(appbar: false),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Person',
            ),
            Tab(
              icon: Icon(Icons.vpn_key),
              text: 'Key',
            ),
          ],
        ),
      ),
    );
  }
}
