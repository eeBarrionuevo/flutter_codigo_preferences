import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/widgets/menu_widget.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        backgroundColor: Colors.teal,
      ),
      drawer: MenuWidget()
    );
  }
}
