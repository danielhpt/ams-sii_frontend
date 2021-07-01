import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/widgets/forms/VictimForm.dart';
import 'package:project/widgets/lists/EvaluationsListPage.dart';
import 'package:project/widgets/lists/PharmaciesListPage.dart';

class VictimFormState extends State<VictimForm> {
  final formKey;
  final Victim victim;
  final bool enabled;
  final bool add;
  bool medicalFollowup;

  @override
  void initState() {
    super.initState();
    medicalFollowup = victim.medicalFollowup;
  }

  VictimFormState({this.add, this.formKey, this.victim, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Card(
            child: ExpandablePanel(
              header: ListTile(
                title: Text('Identificação'),
              ),
              expanded: Column(
                children: [
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.name,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nome',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.name = value.trim();
                    },
                  ),
                  FormField(
                    //todo Data de Nascimento
                    enabled: enabled,
                    builder: (FormFieldState<dynamic> state) {
                      return InputDatePickerFormField(
                        lastDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        initialDate: victim.birthdate,
                        onDateSaved: (DateTime value) {
                          victim.birthdate = value;
                        },
                      );
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.access_time),
                      labelText: 'Idade',
                    ),
                    onSaved: (String value) {
                      victim.age = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    initialValue:
                        victim.age != null ? victim.age.toString() : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      return (value != null && int.tryParse(value) == null)
                          ? 'Não é um Numero'
                          : (value != null && int.parse(value) < 0)
                              ? 'Invalido'
                              : null;
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.gender,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.attribution_outlined),
                      labelText: 'Genero',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.gender = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.identityNumber,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_outlined),
                      labelText: 'Documento',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      victim.identityNumber = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.address,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.home_outlined),
                      labelText: 'Morada',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      victim.address = value.trim();
                    },
                  ),
                  ExpandableButton(
                    child: Card(
                      child: ListTile(
                        title: Text('Colapsar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: ExpandablePanel(
              header: ListTile(
                title: Text('Historial Clínico'),
              ),
              expanded: Column(
                children: [
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.circumstances,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_outlined),
                      labelText: 'Circunstancias',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.circumstances = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.diseaseHistory,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.access_time),
                      labelText: 'Histórico de Doenças',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.diseaseHistory = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.allergies,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.warning_amber_outlined),
                      labelText: 'Alergias',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.allergies = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.lastMeal,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Última refeição',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.lastMeal = value.trim();
                    },
                  ),
                  FormField(
                    //todo Horario da Última refeição
                    enabled: enabled,
                    builder: (FormFieldState<dynamic> state) {
                      return InputDatePickerFormField(
                        lastDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        initialDate: victim.lastMealTime,
                        onDateSaved: (DateTime value) {
                          victim.lastMealTime = value;
                        },
                      );
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.usualMedication,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_outlined),
                      labelText: 'Nome',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.usualMedication = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.riskSituation,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_outlined),
                      labelText: 'Situação de risco',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      victim.riskSituation = value.trim();
                    },
                  ),
                  ExpandableButton(
                    child: Card(
                      child: ListTile(
                        title: Text('Colapsar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: ExpandablePanel(
              header: ListTile(
                title: Text('Transporte'),
              ),
              expanded: Column(
                children: [
                  FormField(
                    // Completed
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Acompanhamento Médico'),
                        value: medicalFollowup,
                        onChanged: (bool value) {
                          setState(() {
                            medicalFollowup = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      victim.medicalFollowup = medicalFollowup;
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.healthUnitOrigin,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.apartment_outlined),
                      labelText: 'Unidade de Saúde de Origem',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      victim.healthUnitOrigin = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.healthUnitDestination,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.apartment_outlined),
                      labelText: 'Unidade de Saúde de Destino',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      victim.healthUnitDestination = value.trim();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add),
                      labelText: 'Numero do Episodio',
                    ),
                    onSaved: (String value) {
                      victim.episodeNumber = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    initialValue: victim.episodeNumber != null
                        ? victim.episodeNumber.toString()
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      return (value != null && int.tryParse(value) == null)
                          ? 'Não é um Numero'
                          : (value != null && int.parse(value) < 0)
                              ? 'Invalido'
                              : null;
                    },
                  ),
                  //todo typeOfTransport
                  //todo nonTransportReason
                  ExpandableButton(
                    child: Card(
                      child: ListTile(
                        title: Text('Colapsar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: ExpandablePanel(
              header: ListTile(
                title: Text('Outros'),
              ),
              expanded: Column(
                children: [
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.address,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_outlined),
                      labelText: 'Tipo de Emergência',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      victim.typeOfEmergency = value.trim();
                    },
                  ),
                  TextFormField(
                    enabled: enabled,
                    initialValue: victim.address,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_outlined),
                      labelText: 'Comentários',
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (String value) {
                      victim.comments = value.trim();
                    },
                  ),
                  FormField(
                    //todo SIV/SAV
                    enabled: enabled,
                    builder: (FormFieldState<dynamic> state) {
                      return InputDatePickerFormField(
                        lastDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        initialDate: victim.siv_sav,
                        onDateSaved: (DateTime value) {
                          victim.siv_sav = value;
                        },
                      );
                    },
                  ),
                  ExpandableButton(
                    child: Card(
                      child: ListTile(
                        title: Text('Colapsar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: add,
            child: Card(
              child: ListTile(
                title: Text('Avaliações'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EvaluationsListPage(
                      enabled: enabled,
                      evaluations: victim.evaluations,
                    );
                  }));
                },
              ),
            ),
          ),
          Visibility(
            visible: add,
            child: Card(
              child: ListTile(
                title: Text('Fármacos'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PharmaciesListPage(
                      enabled: enabled,
                      pharmacies: victim.pharmacies,
                    );
                  }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
