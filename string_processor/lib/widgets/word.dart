import 'package:flutter/material.dart';
import 'message.dart';

class Word extends StatefulWidget {
  final word;

  Word(this.word);

  @override
  _WordState createState() => _WordState(word, 0);
}

class _WordState extends State<Word> {
  final String buttonLabel;
  int clicks;
  var defaultFontSize = 25.0;
  _WordState(this.buttonLabel, this.clicks);

  String getButtonLabel() {
    return buttonLabel;
  }

  _handlePress() {
    if (clicks >= 2) {
      setState(() => clicks = 0);
    } else if (clicks == 1) {
      setState(() => clicks = clicks + 1);
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Message(widget.word);
          });
    } else {
      setState(() => clicks = clicks + 1);
    }
  }

  _clearSelection() {
    setState(() => clicks = 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _handlePress(),
        onLongPress: () => _clearSelection(),
        child: Container(
          color: clicks > 0 ? Colors.yellow : null,
          padding: EdgeInsets.only(top: 1, bottom: 1, left: 4, right: 4),
          child: Text(
            buttonLabel,
            style: TextStyle(fontSize: defaultFontSize),
            textAlign: TextAlign.left,
          ),
        ));
  }
}
