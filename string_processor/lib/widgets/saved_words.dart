import 'package:flutter/material.dart';

class SavedWords extends StatefulWidget {
  var saved;
  SavedWords(this.saved);
  @override
  _SavedWordsState createState() => _SavedWordsState();
}

class _SavedWordsState extends State<SavedWords> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            )));
  }
}
