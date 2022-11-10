import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart Placeholder'),
            ),
          ),
          Card(
            child: Text('Transaction List Placeholder'),
          ),
        ],
      ),
    );
  }
}





// #70 - overview of project
// #71 - overview of core flutter widgets
// #72 - planning the app
// #73 - combining widgets 
/// Setup of new project, planning the layout, create placeholder widgets, 
/// working with card widgets, understanding how parent/child dependecies work.
/// How container widgets work with child and parent widgets.
/// Card widget depends on the size of the child, unless the parent widget
/// has its own defined width, then the card takes the width of the parent. 
/// Column will take the width as its widest child.