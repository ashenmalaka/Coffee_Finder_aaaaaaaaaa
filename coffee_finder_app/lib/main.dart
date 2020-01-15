import 'package:flutter/material.dart';

void main(){
  return runApp(
    new MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Coffess Shops",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyMapPage(
        title: "My Coffee Shops",
      )
    );
  }

}
