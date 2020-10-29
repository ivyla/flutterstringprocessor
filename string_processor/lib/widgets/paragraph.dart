import 'package:flutter/material.dart';
import 'word.dart';
// Credits:
// RegExp for parsedString: https://stackoverflow.com/questions/53239702/how-to-remove-only-symbols-from-string-in-dart

class Paragraph extends StatefulWidget {
  final paragraph;
  Paragraph(this.paragraph);
  @override
  _ParagraphState createState() => _ParagraphState(paragraph);
}

class _ParagraphState extends State<Paragraph> {
  List jsonData;
  String paragraph;
  _ParagraphState(this.paragraph);
  @override
  Widget build(BuildContext context) {
    var parsedText = paragraph.split(" ");
    var parsedParagraphs = paragraph.split("\n");

// Single Paragraph without \n
    return SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Container(
            child: Wrap(
          alignment: WrapAlignment.start,
          children: parsedText.map((wordLabel) => Word(wordLabel)).toList(),
        )));
  }
}
