import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  bool _color = false;
  String _name = "";
  String _address = "";
  int _gender = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValues();
  }

  getValues() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _color = prefs.getBool("colorSecundario") ?? false;
    _name = prefs.getString("namex") ?? "";
    _address = prefs.getString("address") ?? "";
    _gender = prefs.getInt("genero") ?? 1;
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        backgroundColor: _color ? Colors.pinkAccent : Colors.teal,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(25.0)
          ),
          padding: EdgeInsets.all(25.0),
          margin: EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(_name),
                subtitle: Text("Nombres"),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(_address),
                subtitle: Text("Dirección"),
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: Text(_gender == 1 ? "Masculino" : "Femenino"),
                subtitle: Text("Género"),
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: Text(_color ? "Activo" : "Desactivo"),
                subtitle: Text("Color secundario"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
