import 'package:flutter/material.dart';

void main(){
  runApp(QuickNotes());
}

class QuickNotes extends StatefulWidget {
  @override
  _QuickNotesState createState() => _QuickNotesState();
}

class _QuickNotesState extends State<QuickNotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff50002a),
      ),
      home: QuickNotesMainPage(),
    );
  }
}

class QuickNotesMainPage extends StatefulWidget {
  @override
  _QuickNotesMainPageState createState() => _QuickNotesMainPageState();
}

class _QuickNotesMainPageState extends State<QuickNotesMainPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      
    );
  }
}