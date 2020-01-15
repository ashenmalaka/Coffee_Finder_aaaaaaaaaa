import 'package:flutter/material.dart';

class MyMapPage extends StatefulWidget {
  MyMapPage ({Key key, this.title}) : super(key:key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyMapPageState();
  }

}

class _MyMapPageState extends State<MyMapPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        ),
        body: new Center(

        ),
      );
    }
  }