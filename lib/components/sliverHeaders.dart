import 'package:flutter/material.dart';
import 'package:quicknotes/components/customSliverAppBarDelegate.dart';

List<Widget> sliverHeader(TabController _tabController){
return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                elevation: 0.0,
                pinned:true,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("not scrolled"),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    indicatorWeight: 5.0,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.white30,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Notes"),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "To-Dos"),
                    ],
                  ),
                ),
              ),
            ];
}