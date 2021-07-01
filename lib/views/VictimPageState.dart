import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/VictimPage.dart';
import 'package:project/widgets/forms/VictimForm.dart';

class VictimPageState extends State<VictimPage> {
  final formKey = GlobalKey<FormState>();
  final Victim victim;
  final bool add;
  final int occurrenceId;
  final bool enabled;

  VictimPageState({this.enabled, this.occurrenceId, this.add, this.victim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SIREPH Técnicos')),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              VictimForm(
                  victim: this.victim,
                  formKey: this.formKey,
                  enabled: enabled,
                  add: add),
              Visibility(
                visible: enabled,
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton.icon(
                    label: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    icon: Icon(
                      Icons.save,
                      size: 50.0,
                    ),
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        try {
                          if (add) {
                            var v = await postOccurrenceVictim(
                                occurrenceId, victim.toJson());
                          } else {
                            var v = await putVictim(victim.id, victim.toJson());
                          }
                          Navigator.pop(context, 'add');
                        } catch (e) {
                          showToast("Erro ao Guardar a Vitima");
                        }
                      } else {
                        showToast("Valor(es) Invalido(s)");
                      }
                    },
                    style: ButtonStyle(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
