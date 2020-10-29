import 'package:flutter/material.dart';
import 'widgets/paragraph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String fullText =
      '''The researchers found that word recall was greatest when the participants read aloud to themselves. \n “This study confirms that learning and memory benefit from active involvement,” says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo. \n Here's another sample text to show that the list view works!''';
  @override
  Widget build(BuildContext context) {
    var stringLists = fullText.split("\n");

    return MaterialApp(
      title: 'String Processor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('The Impact of Reading Aloud'),
          ),
          body: new ListView.builder(
              itemCount: stringLists.length,
              itemBuilder: (BuildContext context, int index) {
                // Paragraph
                return Paragraph(stringLists[index]);
              })),
    );
  }
}

// body: Center(child: Paragraph(fullText))),
