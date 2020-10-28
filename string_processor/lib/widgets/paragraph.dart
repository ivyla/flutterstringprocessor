import 'package:flutter/material.dart';
import 'word.dart';

// RegExp for parsedString: https://stackoverflow.com/questions/53239702/how-to-remove-only-symbols-from-string-in-dart

class Paragraph extends StatelessWidget {
  // read text from file, parse and print to page
  // final textFile = new File('assets/originaltext.txt').readAsStringSync();
  var paragraph =
      '''The researchers found that word recall was greatest when the participants read aloud to
    themselves.
    “This study confirms that learning and memory benefit from active involvement,” says study
    author Colin M. MacLeod, a professor and chair of the Department of Psychology at the
    University of Waterloo.''';

  @override
  Widget build(BuildContext context) {
    var parsedText =
        paragraph.replaceAll(new RegExp(r'[^\w\s]+'), "").split(" ");

    print(parsedText);
    return Container(
      child: Row(
        children: <Widget>[
          Word("yeet"),
          Word("yote"),
        ],
      ),
    );
  }
}
