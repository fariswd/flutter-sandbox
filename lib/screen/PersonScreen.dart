import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

int count(num) {
  return num + 1;
}

class PersonScreen extends StatefulWidget {
  @override
  _PersonScreen createState() => new _PersonScreen();
}

class _PersonScreen extends State<PersonScreen> {
  List data;
  List memberIzone = [
    {
      "name": "Sakura",
      "image":
          "http://stage48.net/wiki/images/thumb/b/b0/MiyawakiSakura1stMiniAlbum2.jpg/143px-MiyawakiSakura1stMiniAlbum2.jpg"
    },
    {
      "name": "Hitomi",
      "image":
          "http://stage48.net/wiki/images/thumb/1/1b/HondaHitomi1stMiniAlbum2.jpg/143px-HondaHitomi1stMiniAlbum2.jpg"
    },
    {
      "name": "Nako",
      "image":
          "http://stage48.net/wiki/images/thumb/4/47/YabukiNako1stMiniAlbum2.jpg/143px-YabukiNako1stMiniAlbum2.jpg"
    },
  ];

  Future fetchData() async {
    http.Response result = await http.get(
      'https://jsonplaceholder.typicode.com/posts',
      headers: {'Accept': 'application/json'},
    );

    this.setState(() {
      data = json.decode(result.body);
    });
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('person'),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: memberIzone == null ? 0 : memberIzone.length,
        itemBuilder: (context, index) {
          return Member(
            nameMember: '${memberIzone[index]['name']}',
            imageMember: '${memberIzone[index]['image']}',
          );
        },
      )),
    );
  }
}

class Member extends StatelessWidget {
  Member({this.imageMember, this.nameMember});
  final String imageMember;
  final String nameMember;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Image(
            image: NetworkImage(imageMember),
            width: 100.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Text(
            nameMember,
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
