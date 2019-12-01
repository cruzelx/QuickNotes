import 'package:flutter/material.dart';

void main() {
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
        backgroundColor: Color(0xffe5e5e5),
      ),
      home: QuickNotesMainPage(),
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
          body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            title: Text("This is title"),
            expandedHeight: 200.0,
            elevation: 8.0,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('this is centered'),
                background: Image.network(
                    "https://www.freevector.com/uploads/vector/preview/28054/Time-to-Study.jpg",
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
