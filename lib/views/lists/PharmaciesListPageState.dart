import 'package:flutter/material.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/PharmacyPage.dart';
import 'package:project/widgets/lists/PharmaciesListPage.dart';

class PharmaciesListPageState extends State<PharmaciesListPage> {
  final bool enabled;
  final int victimId;

  PharmaciesListPageState({this.victimId, this.enabled});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVictimPharmaciesList(victimId),
        builder: (context, pharmacies)
    {
      if (!pharmacies.hasData) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          appBar: AppBar(title: Text('SIREPH Técnicos')),
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: pharmacies.data.length,
                    itemBuilder: (context, index) {
                      Pharmacy pharmacy = pharmacies.data[index];
                      return Center(
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(pharmacy.pharmacy),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PharmacyPage(
                                                enabled: false,
                                                victimId: victimId,
                                                pharmacy: pharmacy,
                                                add: false,
                                              )));
                                },
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PharmacyPage(
                                        enabled: enabled,
                                        victimId: victimId,
                                        pharmacy: Pharmacy(),
                                        add: true,
                                      ))).then((value) {
                            if (value == 'create')
                              setState(() {});
                          });
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
    );
  }
}
