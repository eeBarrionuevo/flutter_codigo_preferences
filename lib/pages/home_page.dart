
import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/pages/counter_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
          },
          child: Text("Ir al contador"),
        ),
      ),
    );
  }
}
