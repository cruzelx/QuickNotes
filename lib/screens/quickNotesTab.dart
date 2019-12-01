import 'package:flutter/material.dart';
import 'package:quicknotes/widgets/quickNoteElements.dart';

class QuickNoteTabView extends StatefulWidget {
  @override
  _QuickNoteTabViewState createState() => _QuickNoteTabViewState();
}

class _QuickNoteTabViewState extends State<QuickNoteTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return quickNoteElement(context, index);
      },
    );
  }
}
