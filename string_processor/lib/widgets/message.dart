import 'package:flutter/material.dart';

// take in argument of word (might have parenthesis, whitespace, newline)
// parse it to alphanumeric
// responding to the "correct word" - match the words
// match it with values in the JSON
class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('message widget'),
      content: SingleChildScrollView(
          child: (ListBody(
        children: <Widget>[
          Text("This the word"),
          Text("This is the definition")
        ],
      ))),
    );
  }
}
