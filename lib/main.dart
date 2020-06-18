import 'package:flutter/material.dart';
import 'dart:ui';

import 'camera_page.dart';
import 'pager.dart';
import 'shade.dart';

class EntryPoint extends StatefulWidget {
  _EntryPointState createState() => new _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  final PageController pagerController =
      new PageController(keepPage: true, initialPage: 1);
  TabController _controller;

  double buttonDiameter = 100.0;
  double offsetRatio = 0.0;
  double offsetFromOne = 0.0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this, initialIndex: 1);
    _controller.addListener(() {
      pagerController.animateTo(_controller.offset, duration: Duration(milliseconds: 1), curve: null)
    });
    super.initState();
  }

  bool onPageView(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      setState(() {
        offsetFromOne = 1.0 - pagerController.page;
        offsetRatio = offsetFromOne.abs();
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: TabBar(
        controller: _controller,
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new CameraHome(),
          new Shade(
            opacity: offsetRatio,
            isLeft: offsetFromOne > 0,
          ),
          new NotificationListener<ScrollNotification>(
            onNotification: onPageView,
            child: new Pager(
              controller: pagerController,
              leftWidget: new ItemList(
                amount: 30,
              ),
              rightWidget: new Text('right'),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final int amount;

  ItemList({this.amount});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < amount; i++) {
      children.add(new ListTile(
        title: new Text('tile $i'),
      ));
    }

    return new ListView(
      children: children,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EntryPoint(),
  ));
}
