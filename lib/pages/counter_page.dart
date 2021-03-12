import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Iniciando widget...");
    _loadCounter();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Ejecutando dispose...");
  }

  _loadCounter() async {
    SharedPreferences filemon = await SharedPreferences.getInstance();
    _count = filemon.getInt("counterValue") ?? 0;
    setState(() {

    });
  }


  _incrementCounter() async{
    print("Ingresó al incremento del counter");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _count = (prefs.getInt("counterValue") ?? 0) + 1;
    prefs.setInt("counterValue", _count);
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    print("Construyendo widget...");
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tu contador está en: "),
            Text(_count.toString(), style: TextStyle(fontSize: 45.0),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }


}

