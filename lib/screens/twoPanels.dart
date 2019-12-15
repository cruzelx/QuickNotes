import "package:flutter/material.dart";
import 'dart:math' as math;

import 'package:quicknotes/widgets/backLayerNote.dart';

class TwoPanels extends StatefulWidget {
  final AnimationController animationController;
  TwoPanels({this.animationController});
  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels>
    with SingleTickerProviderStateMixin {
  //final GlobalKey _backdropKey = GlobalKey();
  static const header_height = 40.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, frontPanelHeight),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: widget.animationController, curve: Curves.easeOut));
  }

  void isBackVisible() {
    final AnimationStatus status = widget.animationController.status;
    final bool isOpen = status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
    widget.animationController.fling(velocity: isOpen ? -1.0 : 1.0);
  }

  // void _handleDragUpdate(DragUpdateDetails details) {
  //   final RenderBox renderBox =
  //       _backdropKey.currentContext.findRenderObject() as RenderBox;
  //   final _backdropHeight = math.max(0.0, renderBox.size.height - 56.0 - 92.0);
  //   widget.animationController.value -=
  //       details.primaryDelta / (_backdropHeight ?? details.primaryDelta);
  // }

  // void _handleDragEnd(DragEndDetails details) {
  //   if (widget.animationController.isAnimating ||
  //       widget.animationController.status == AnimationStatus.completed) return;
  // }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: BackdropMenu()
          ),
          PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: Material(
              elevation: 15.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                   onTap: isBackVisible,
                    child: SizedBox(
                      height: header_height,
                      width: double.infinity,
                      child: Container(
                        color: Colors.pink,
                        width: double.infinity,
                        height: header_height,
                        child: Center(
                          child: Text(
                            "frontPanelHeader",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("frontPanel"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}
