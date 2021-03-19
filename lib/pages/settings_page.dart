import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/utils/shared_preferences_global.dart';
import 'package:flutter_codigo_preferences/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _name = "";
  String _address = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  final mandarina = new UserPreference();


  @override
  void initState() {
    print("Este es el inicio...");
    getValuesSharedPreferences();
  }

  saveValuesSharedPreferences() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setBool("colorSecundario", _colorSecundario ?? false);
    //prefs.setInt("genero", _genero);

    // prefs.setString("namex", _name);
    // prefs.setString("address", _address);

    mandarina.color = _colorSecundario ?? false;
    mandarina.genero = _genero ?? 1;
    mandarina.name = _name ?? "No tengo nombre";
    mandarina.address = _address ?? "No tengo dirección";

    print("Color secundario guardado...");
  }

  getValuesSharedPreferences() async {

    _colorSecundario = (mandarina.color) ?? false;
    _genero = (mandarina.genero) ?? 1;
    _name = mandarina.name;
    _address = mandarina.address;

    nameController = TextEditingController(text: _name);
    addressController.text = _address;

    print("Nombre guardado... $_name");

    setState(() {});
    print("Color secundario cargado...");
  }

  @override
  Widget build(BuildContext context) {
    print("Crear widget");
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
        backgroundColor:
            _colorSecundario == true ? Colors.pinkAccent : Colors.teal,
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
                saveValuesSharedPreferences();
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1,
              title: Text("Masculino"),
              groupValue: _genero,
              onChanged: (int valor) {
                setState(() {
                  _genero = valor;
                  saveValuesSharedPreferences();
                  print(_genero);
                });
              },
            ),
            RadioListTile(
              value: 2,
              title: Text("Femenino"),
              groupValue: _genero,
              onChanged: (int valor) {
                setState(() {
                  _genero = valor;
                  saveValuesSharedPreferences();
                  print(_genero);
                });
              },
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nombres",
                  helperText: "Ingresa tus nombres",
                ),
                onChanged: (String value) {
                  print(value);
                  _name = value;
                  saveValuesSharedPreferences();
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                    labelText: "Dirección", helperText: "Ingresa tu dirección",),
                onChanged: (value) {
                  print(value);
                  _address = value;
                  saveValuesSharedPreferences();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
