import 'package:flutter/material.dart';
import 'package:weather_detection_app/screens/loading_screen.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
