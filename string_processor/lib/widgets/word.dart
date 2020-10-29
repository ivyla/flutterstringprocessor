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
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Message(widget.word);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        // padding: EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Text(buttonLabel, style: TextStyle(fontSize: 25.0)),
        onPressed: () => handlePress(),
        color: Colors.blue,
        textColor: Colors.black,
      ),
    );
  }
}
