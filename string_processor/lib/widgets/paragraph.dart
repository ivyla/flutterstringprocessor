import 'package:flutter/material.dart';
import 'word.dart';
// Credits:
// RegExp for parsedString: https://stackoverflow.com/questions/53239702/how-to-remove-only-symbols-from-string-in-dart

class Paragraph extends StatefulWidget {
  @override
  _ParagraphState createState() => _ParagraphState();
}

class _ParagraphState extends State<Paragraph> {
  List jsonData;
  String paragraph =
      '''The researchers found that word recall was greatest when the participants read aloud to themselves. “This study confirms that learning and memory benefit from active involvement,” says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo.''';
  @override
  Widget build(BuildContext context) {
    var parsedText = paragraph.split(" ");

    return SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Container(
            child: Wrap(
          alignment: WrapAlignment.start,
          children: parsedText.map((wordLabel) => Word(wordLabel)).toList(),
        )));
  }
}
