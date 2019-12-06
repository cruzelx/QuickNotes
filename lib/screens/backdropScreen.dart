import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/screens/twoPanels.dart';
import 'package:quicknotes/widgets/backLayerNote.dart';

class BackDropScreen extends StatefulWidget {
  @override
  _BackDropScreenState createState() => _BackDropScreenState();
}

class _BackDropScreenState extends State<BackDropScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  String title = "Add Note";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  bool get isBackVisible {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _animationController.view,
            ),
            onPressed: () {
              setState(() {
                title = "Menu";
              });
              _animationController.fling(
                velocity: isBackVisible ? -1.0 : 1.0,
              );
            },
          ),
        ],
      ),
      body: TwoPanels(animationController: _animationController,),
    );
  }
}
