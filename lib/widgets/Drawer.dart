import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Bem-Vindo!'),
          ),
          ListTile(
            title: Text('Ocorrências'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Equipa'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}