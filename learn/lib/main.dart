import 'package:flutter/material.dart';
import 'package:learn/pages/home.dart';
import 'package:learn/pages/loading.dart';
import 'package:learn/pages/choose_location.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ),
  );
}
