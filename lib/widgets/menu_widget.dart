import 'package:flutter/material.dart';
import 'package:flutter_codigo_preferences/pages/menu_page.dart';
import 'package:flutter_codigo_preferences/pages/settings_page.dart';


class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://www.pixel4k.com/wp-content/uploads/2019/03/abstract-green-gradient_1551645877.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            // child: Container(
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //         radius: 30,
            //       ),
            //       Text("Juan Pedro Lopez")
            //     ],
            //   ),
            // ),
          ),

          ListTile(
            leading: Icon(Icons.pages, color: Colors.teal,),
            title: Text("Inicio"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.teal,),
            title: Text("Calendario"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.teal,),
            title: Text("Compartir"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.teal,),
            title: Text("Configuración"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.teal,),
            title: Text("Cerrar Sesión"),
            onTap: (){

            },
          ),

        ],
      ),
    );
  }
}
