import 'package:flutter/material.dart';

class NoteEditorScreen extends StatefulWidget {
  @override
  _NoteEditorScreenState createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  bool isBookmarked = false;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("SAVE"),
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
                child: (isBookmarked)
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_border)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap:(){},
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      helperText: "Enter Title",
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      maxLength: 500,
                      decoration: InputDecoration(
                        helperText: "Enter Content",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
