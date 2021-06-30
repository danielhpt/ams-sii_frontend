import 'package:flutter/material.dart';
import 'package:project/widgets/Drawer.dart';
import 'package:project/widgets/HomePage.dart';
import 'package:project/widgets/TeamPage.dart';

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.tightFor(width: 300, height: 200),
                child: ElevatedButton(
                  onPressed: goto,
                  style: ButtonStyle(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        size: 70.0,
                      ),
                      Text(
                        'Histórico de Ocorrências',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                constraints: BoxConstraints.tightFor(width: 300, height: 200),
                child: ElevatedButton(
                  onPressed:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => TeamPage(title: 'SIREPH Técnicos Home Page'))),
                  style: ButtonStyle(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.group,
                        size: 70.0,
                      ),
                      Text(
                        'Gerir Equipa',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                constraints: BoxConstraints.tightFor(width: 300, height: 200),
                child: ElevatedButton(
                  onPressed: goto,
                  style: ButtonStyle(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.assignment_late,
                        size: 70.0,
                      ),
                      Text(
                        'Abrir Ocorrência',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void goto() {}
