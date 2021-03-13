import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;


  @override
  Widget build(BuildContext context) {
    print("Crear widget");
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
        backgroundColor: Colors.teal,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: ListView(
          children: [
            Text(
              "Configuración",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text("Color secundario"),
              subtitle: Text("Si quieres puedes activarlo"),
              onChanged: (valor) {
                _colorSecundario = valor;
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1,
              title: Text("Masculino"),
              groupValue: _genero,
              onChanged: (int valor){
                setState(() {
                  _genero = valor;
                });
              },
            ),
            RadioListTile(
              value: 2,
              title: Text("Femenino"),
              groupValue: _genero,
              onChanged: (int valor){
                setState(() {
                  _genero = valor;
                });
              },
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Nombres",
                  helperText: "Ingresa tus nombres"
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Dirección",
                    helperText: "Ingresa tu dirección"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
