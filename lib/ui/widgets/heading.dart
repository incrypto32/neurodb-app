import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key key, this.boldedText = "Neuro", this.normalText = "DB"})
      : super(key: key);

  final String boldedText;
  final String normalText;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 30),
      child: Container(
        child: Row(children: <Widget>[
          Text(
            boldedText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(normalText),
        ]),
      ),
    );
  }
}
