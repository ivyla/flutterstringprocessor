import 'package:flutter/material.dart';
import 'dart:convert';

// take in argument of word (might have parenthesis, whitespace, newline)
// parse it to alphanumeric
// responding to the "correct word" - match the words
// match it with values in the JSON
class Message extends StatefulWidget {
  final messageLabelParent;
  Message(this.messageLabelParent);

  @override
  _MessageState createState() => _MessageState(messageLabelParent);
}

class _MessageState extends State<Message> {
  String messageLabelChild;

  _MessageState(this.messageLabelChild);

  @override
  Widget build(BuildContext context) {
    String parsedWord =
        messageLabelChild.replaceAll(new RegExp(r'[^\w\s]+'), "");
    String definitionText = "";
    // parse the message label into an alphabetical word,
    // look up clean word in the json file
    return Center(
        child: SingleChildScrollView(
      child: ListBody(
          //center
          children: <Widget>[
            FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/words.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  int indexKey;
                  var wordsData = json.decode(snapshot.data.toString());
                  // find index of the parsed word
                  for (int i = 0; i < wordsData.length; i++) {
                    if ((wordsData[i]['word'].toUpperCase())
                            .compareTo(parsedWord.toUpperCase()) ==
                        0) {
                      indexKey = i;
                      definitionText = wordsData[indexKey]['key'];
                      break;
                    } else {
                      indexKey = -1;
                      definitionText = "Definition not found";
                    }
                  }
                  return AlertDialog(
                    title: Text(parsedWord),
                    content: SingleChildScrollView(
                        child: (ListBody(
                      children: <Widget>[
                        // Text("Index " + index),
                        Text("/həˈlō,heˈlō wərld/"),
                        Text("Key: " + definitionText),
                        Text(
                            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin iaculis tristique purus.\" ''')
                      ],
                    ))),
                  );
                }),
          ]),
    ));
  }
}

// Widget build(BuildContext context) {
//   // parse the message label into an alphabetical word,
//   // look up clean word in the json file
//   return AlertDialog(
//     title: Text(messageLabelChild),
//     content: SingleChildScrollView(
//         child: (ListBody(
//       children: <Widget>[
//         Text("/həˈlō,heˈlō wərld/"),
//         Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin iaculis tristique purus.\" ")
//       ],
//     ))),
//   );
// }
