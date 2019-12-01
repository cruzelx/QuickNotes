import 'package:flutter/material.dart';
import 'package:quicknotes/components/sliverHeaders.dart';
import 'package:quicknotes/screens/quickNotesTab.dart';
import 'package:quicknotes/screens/toDoTabView.dart';
import 'package:quicknotes/theme/theme.dart';
import 'package:quicknotes/widgets/FAB.dart';

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
      theme: themeData,
      home: QuickNotesMainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuickNotesMainPage extends StatefulWidget {
  @override
  _QuickNotesMainPageState createState() => _QuickNotesMainPageState();
}

class _QuickNotesMainPageState extends State<QuickNotesMainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2,initialIndex: 0)
    ..addListener((){
      setState(() {
        
      });
    });
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return sliverHeader(_tabController);
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              QuickNoteTabView(),
              ToDoTabView(),
            ],
          ),
        ),
      ),
      floatingActionButton: fab(context, _tabController),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
