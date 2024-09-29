import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  TextField(
  decoration: InputDecoration(
    labelText: 'Enter your symptoms',
  ),
);

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagnostic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Diagnostic App'),
        ),
        body: Center(
          child: Text('Welcome to the Diagnostic App!'),
        ),
      ),
    );
  }
}
