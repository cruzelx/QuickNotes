import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget quickNoteElement(BuildContext context, int index) {
  return Column(
    children: <Widget>[
      Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: ListTile(
          title: Text("Tile ${index}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Loreum Ipseum"),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Date"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            color: Colors.transparent,
            iconWidget:CircleAvatar(
              radius: 25.0,
              child: Icon(Icons.bookmark_border),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
            ) ,
            onTap: () {
              final snackBar = SnackBar(
                content: Text("Bookmarked Successfully"),
              );
              Scaffold.of(context).removeCurrentSnackBar();
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.transparent,
            iconWidget:CircleAvatar(
              radius: 25.0,
              child: Icon(Icons.delete),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ) ,
            onTap: () {
              final snackBar = SnackBar(
                content: Text("Deleted Successfully"),
              );
              Scaffold.of(context).removeCurrentSnackBar();
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      Divider(
        indent: 15.0,
        endIndent: 15.0,
      ),
    ],
  );
}
