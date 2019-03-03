import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({this.title, this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Container(
        child: Center(
          child: Image(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
