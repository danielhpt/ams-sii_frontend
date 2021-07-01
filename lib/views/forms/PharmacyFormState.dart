import 'package:flutter/material.dart';
import 'package:project/widgets/forms/PharmacyForm.dart';

import '../../models/Pharmacy.dart';

class PharmacyFormState extends State<PharmacyForm> {
  final formKey;
  final Pharmacy pharmacy;
  final bool enabled;

  PharmacyFormState({this.formKey, this.pharmacy, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormField(
            //todo time
            enabled: enabled,
            builder: (FormFieldState<dynamic> state) {
              return InputDatePickerFormField(
                lastDate: DateTime.now(),
                firstDate: DateTime(1900),
                initialDate:
                    pharmacy.time == null ? DateTime.now() : pharmacy.time,
                onDateSaved: (DateTime value) {
                  pharmacy.time = value;
                },
              );
            },
          ),
          TextFormField(
            enabled: enabled,
            initialValue: pharmacy.pharmacy,
            decoration: const InputDecoration(
              icon: Icon(Icons.attribution_outlined),
              labelText: 'Fármaco',
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              pharmacy.pharmacy = value.trim();
            },
          ),
          TextFormField(
            enabled: enabled,
            initialValue: pharmacy.dose,
            decoration: const InputDecoration(
              icon: Icon(Icons.attribution_outlined),
              labelText: 'Dose',
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              pharmacy.dose = value.trim();
            },
          ),
          TextFormField(
            enabled: enabled,
            initialValue: pharmacy.route,
            decoration: const InputDecoration(
              icon: Icon(Icons.attribution_outlined),
              labelText: 'Via',
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              pharmacy.route = value.trim();
            },
          ),
          TextFormField(
            enabled: enabled,
            initialValue: pharmacy.adverseEffect,
            decoration: const InputDecoration(
              icon: Icon(Icons.attribution_outlined),
              labelText: 'Efeito adverso',
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              pharmacy.adverseEffect = value.trim();
            },
          ),
        ],
      ),
    );
  }
}
