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
      child: RawMaterialButton(
        // padding: EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Text(buttonLabel, style: TextStyle(fontSize: defaultFontSize)),
        onPressed: () => handlePress(),
        fillColor: Colors.blue,
        constraints:
            BoxConstraints(minWidth: buttonLabel.length.toDouble() * 14),
        // textColor: Colors.black,
      ),
    );
  }
}
// Widget build(BuildContext context) {
//   return Container(
//     child: FlatButton(
//       // padding: EdgeInsets.all(0),
//       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       child: Text(buttonLabel, style: TextStyle(fontSize: 25.0)),
//       onPressed: () => handlePress(),
//       color: Colors.blue,
//       textColor: Colors.black,
//     ),
//   );
// }
