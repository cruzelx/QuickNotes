import 'package:flutter/material.dart';
import 'package:quicknotes/screens/noteEditor.dart';

Widget fab(BuildContext context, TabController _tabController) {
  return _tabController.index == 0
      ? FloatingActionButton.extended(  
          icon: Icon(Icons.add),
          label: Text("Note"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteEditorScreen(),
                ));
          },
          backgroundColor: Theme.of(context).primaryColor)

      : FloatingActionButton.extended( 
          icon: Icon(Icons.add),
          label: Text("To-Do"),
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor);
}
