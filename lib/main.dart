import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/pages/home_page.dart';
import 'package:flutter_codigo_preferences/pages/menu_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}



