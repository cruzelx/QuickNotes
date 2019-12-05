import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/widgets/backLayerNote.dart';

class BackDropScreen extends StatefulWidget {
  @override
  _BackDropScreenState createState() => _BackDropScreenState();
}

class _BackDropScreenState extends State<BackDropScreen> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text("Title"),
      headerHeight: MediaQuery.of(context).size.height*0.5,
      frontLayer: Center(
        // child: Scaffold(
        //   floatingActionButton: FloatingActionButton.extended(
        //     icon: Icon(Icons.add),
        //     label: Text("add"),
        //   ),
        ),
        
      
      backLayer: Center(
        child: BackdropMenu(),
      ),
      iconPosition: BackdropIconPosition.action,

    );
  }
}