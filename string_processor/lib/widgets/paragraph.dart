import 'package:flutter/material.dart';
import 'word.dart';

// RegExp for parsedString: https://stackoverflow.com/questions/53239702/how-to-remove-only-symbols-from-string-in-dart
// read text from file, parse and print to page
// final textFile = new File('assets/originaltext.txt').readAsStringSync();

// http://www.androidcoding.in/2020/09/14/flutter-local-json/
// @override
// Widget build(BuildContext context) {

//   print(parsedText);
//   return Container(
//     child: Row(
//       children: <Widget>[
//         Word("yeet"),
//         Word("yote"),
//       ],
//     ),
//   );
// }

class Paragraph extends StatefulWidget {
  @override
  _ParagraphState createState() => _ParagraphState();
}

// https://m.clearbluedesign.com/creating-widgets-with-custom-builder-functions-in-flutter-b4ab0cf6e440

class _ParagraphState extends State<Paragraph> {
  List jsonData;
  String paragraph =
      '''The researchers found that word recall was greatest when the participants read aloud to themselves.
    “This study confirms that learning and memory benefit from active involvement,” says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo.''';
  @override
  Widget build(BuildContext context) {
    var parsedText =
        // paragraph.replaceAll(new RegExp(r'[^\w\s]+'), "").split(" ");
        paragraph.split(" ");

    return SingleChildScrollView(
        child: Container(
            child: Wrap(
      alignment: WrapAlignment.start,
      children: parsedText.map((wordLabel) => Word(wordLabel)).toList(),
    )));
  }
}
