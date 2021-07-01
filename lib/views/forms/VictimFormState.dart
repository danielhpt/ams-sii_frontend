import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/NonTransportReason.dart';
import 'package:project/models/TypeOfTransport.dart';
import 'package:project/models/Victim.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/ProceduresPage.dart';
import 'package:project/widgets/forms/VictimForm.dart';
import 'package:project/widgets/lists/EvaluationsListPage.dart';
import 'package:project/widgets/lists/PharmaciesListPage.dart';

class VictimFormState extends State<VictimForm> {
  final formKey;
  final Victim victim;
  final bool enabled;
  final bool add;
  bool medicalFollowup;
  var _currentSelectedValue1;
  var _currentSelectedValue2;

  var _typeOfTransport = [
    "Primário",
    "Secundário",
    "Não Transporte",
    ""
  ];

  Map<String, dynamic> typeOfTransportJson = <String, dynamic>{
    "Primário": 1,
    "Secundário": 2,
    "Não Transporte": 3,
    "": null
  };

  var _nonTransportReason = [
    "Abandonou o local",
    "Decisão médica",
    "Morte",
    "Recusou e assinou",
    "Recusou e não assinou",
    "Desativação",
    ""
  ];

  Map<String, dynamic> nonTransportReasonJson = <String, dynamic>{
    "Abandonou o local": 1,
    "Decisão médica": 2,
    "Morte": 3,
    "Recusou e assinou": 4,
    "Recusou e não assinou": 5,
    "Desativação": 6,
    "": null
  };

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
                    //todo birthdate
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
                      labelText: 'Medicação habitual',
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
                  FormField<String>(
                    builder: (FormFieldState<String> typeOfTransport) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          //labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Tipo de Transporte',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: _currentSelectedValue1 == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSelectedValue1,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _currentSelectedValue1 = newValue;
                                typeOfTransport.didChange(newValue);
                              });
                            },
                            items: _typeOfTransport.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    onSaved: (String value){
                      var id = typeOfTransportJson[_currentSelectedValue1];
                      if (id != null)
                        victim.typeOfTransport = TypeOfTransport(id: id, typeOfTransport: _currentSelectedValue1);
                    },
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          //labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Razão para o Não Transporte',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: _currentSelectedValue2 == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSelectedValue2,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _currentSelectedValue2 = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _nonTransportReason.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    onSaved: (String value){
                      var id = nonTransportReasonJson[_currentSelectedValue2];
                      if (id != null)
                        victim.nonTransportReason = NonTransportReason(id: id, nonTransportReason: _currentSelectedValue2);
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
            visible: !add,
            child: Card(
              child: ListTile(
                title: Text('Avaliações'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () async {
                  if (victim.evaluations == null) victim.evaluations = await getVictimEvaluationsList(victim.id);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EvaluationsListPage(
                      enabled: enabled,
                      victimId: victim.id,
                    );
                  }));
                },
              ),
            ),
          ),
          Visibility(
            visible: !add,
            child: Card(
              child: ListTile(
                title: Text('Fármacos'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () async {
                  if (victim.pharmacies == null) victim.pharmacies = await getVictimPharmaciesList(victim.id);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PharmaciesListPage(
                      enabled: enabled,
                      victimId: victim.id,
                    );
                  }));
                },
              ),
            ),
          ),
          Visibility(
            visible: !add,
            child: Card(
              child: ListTile(
                title: Text('Procedimentos'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProceduresPage(
                      enabled: enabled,
                      victimId: victim.id,
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
