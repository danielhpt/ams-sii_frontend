import 'package:flutter/material.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/lists/PharmaciesListPage.dart';

class PharmaciesListPageState extends State<PharmaciesListPage> {
  final String title;
  final List<Pharmacy> pharmacies;
  final bool enabled;

  PharmaciesListPageState({this.enabled, this.title, this.pharmacies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: pharmacies.length,
                itemBuilder: (context, index) {
                  Pharmacy pharmacy = pharmacies[index];
                  return Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(pharmacy.pharmacy),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Visibility(
                visible: enabled,
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton.icon(
                    label: Text(
                      'Adicionar Fármaco',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 50.0,
                    ),
                    onPressed: () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PharmacyPage(
                                  title: 'SIREPH Técnicos Home Page',
                                  enabled: true)));*/
                    },
                    style: ButtonStyle(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
