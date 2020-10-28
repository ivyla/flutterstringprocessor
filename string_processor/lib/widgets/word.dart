import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  final word;
  Word(this.word);

  @override
  _WordState createState() => _WordState(word);
}

class _WordState extends State<Word> {
  final String buttonLabel;
  _WordState(this.buttonLabel);

  String getButtonLabel() {
    return buttonLabel;
  }

  // final int clicks;
  // const WordState()
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(buttonLabel, style: TextStyle(fontSize: 20.0)),
        onPressed: () => print(getButtonLabel() + " was touched!"),
        color: Colors.blue,
        textColor: Colors.black,
      ),
    );
  }
}
