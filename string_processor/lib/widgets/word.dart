import 'package:flutter/material.dart';
import 'message.dart';

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

  handlePress() {
    print(getButtonLabel() + " was touched!");
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Message();
        });
    // display a message widget
  }

  // final int clicks;
  // const WordState()
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(buttonLabel, style: TextStyle(fontSize: 20.0)),
        onPressed: () => handlePress(),
        color: Colors.blue,
        textColor: Colors.black,
      ),
    );
  }
}
