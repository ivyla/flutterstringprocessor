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
                  if (!snapshot.hasData) {
                    return Center(child: Text("Getting definition.."));
                  } else {
                    // Decode the JSON
                    int indexKey;
                    var wordsData = json.decode(snapshot.data);
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
                      title: Text(parsedWord.toLowerCase(),
                          style: TextStyle(fontSize: 35)),
                      content: SingleChildScrollView(
                          child: (ListBody(
                        children: <Widget>[
                          // Text("Index " + index),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(children: [
                                Text("/heh-low-world/   "),
                                Icon(Icons.volume_up),
                              ])),

                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Key: " + definitionText,
                                style: TextStyle(fontSize: 20),
                              )),

                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin iaculis tristique purus.\" ''',
                                style: TextStyle(fontSize: 20),
                              )),

                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: RawMaterialButton(
                                  onPressed: () => {},
                                  fillColor: Theme.of(context).primaryColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Text('Add to My Words'),
                                    ],
                                  )))
                        ],
                      ))),
                    );
                  }
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
