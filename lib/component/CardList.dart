import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  CardList({this.cardTitle, this.cardIcon, this.cardColor, this.routeName});
  final String cardTitle;
  final String routeName;
  final IconData cardIcon;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, routeName);
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                cardIcon,
                color: cardColor,
                size: 70.0,
              ),
              Align(
                child: Text(
                  cardTitle,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}