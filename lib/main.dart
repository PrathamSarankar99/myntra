import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myntra/screens/homepage.dart';

void main() {
  runApp(MyntraApp());
}

class MyntraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myntra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Myntra(),
    );
  }
}

class Myntra extends StatefulWidget {
  Myntra({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Myntra> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
