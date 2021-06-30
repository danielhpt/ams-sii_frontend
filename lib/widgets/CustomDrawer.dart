import 'package:flutter/material.dart';
import 'package:project/utils/Rest.dart';

class CustomDrawer extends StatelessWidget {
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
            child: Text(
              'Bem-Vindo! ' + user.getFullName(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            title: Text('Ocorrências',
              style: TextStyle(fontSize: 16),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Equipa',
              style: TextStyle(fontSize: 16),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
