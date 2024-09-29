import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Med Friend"),
          backgroundColor: Colors.deepPurple[100],
          leading: Icon(Icons.menu),

        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              //curving the corners a bit
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(25),
            child: Icon(
              Icons.favorite,
              color: Colors.blue[50],
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}
