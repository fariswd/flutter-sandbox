import 'package:flutter/material.dart';

class KeyScreen extends StatefulWidget {
  KeyScreen({this.appbar});
  final bool appbar;

  @override
  _KeyScreenState createState() => _KeyScreenState();
}

class _KeyScreenState extends State<KeyScreen> {
  String inputText;

  TextEditingController inputController = TextEditingController();
  TextEditingController alertController = TextEditingController();
  TextEditingController snackController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  void _showAlert(String str) {
    if (str.isEmpty) return;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('$str'),
            actions: <Widget>[
              FlatButton(
                child: Text('oke'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showSnackBar(String str) {
    if (str.isEmpty) return;

    _scaffoldState.currentState.showSnackBar(
      SnackBar(
        content: Text('$str'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: widget.appbar
          ? AppBar(
              title: Text('key screen'),
            )
          : null,
      body: Container(
        child: Column(
          children: <Widget>[
            Text('type: ${inputText == null ? '' : inputText}'),
            TextField(
              controller: inputController,
              decoration: InputDecoration(hintText: 'input text'),
              onSubmitted: (String str) {
                this.setState(() {
                  inputText = str;
                  inputController.text = '';
                });
              },
            ),
            TextField(
              controller: alertController,
              decoration: InputDecoration(hintText: 'for alert'),
              onSubmitted: (String str) {
                this.setState(() {
                  inputText = str;
                  alertController.text = '';
                });
                _showAlert(str);
              },
            ),
            TextField(
              controller: snackController,
              decoration: InputDecoration(hintText: 'for Snackbar'),
              onSubmitted: (String str) {
                this.setState(() {
                  inputText = str;
                  snackController.text = '';
                  _showSnackBar(str);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
