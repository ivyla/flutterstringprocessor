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
    if (clicks == 2) {
      setState(() => clicks = 0);
    } else if (clicks == 1) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Message(widget.word);
          });
    } else {
      setState(() => clicks = clicks + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(1),
      padding: EdgeInsets.only(left: 0, right: 1, top: 1, bottom: 1),
      child: RawMaterialButton(
        padding: EdgeInsets.only(left: 0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Text(
          buttonLabel,
          style: TextStyle(fontSize: defaultFontSize),
          textAlign: TextAlign.left,
        ),
        onPressed: () => _handlePress(),
        fillColor: clicks > 0 ? Colors.yellow : null,
        constraints:
            BoxConstraints(minWidth: buttonLabel.length.toDouble() * 14),
        // textColor: Colors.black,
      ),
    );
  }
}
