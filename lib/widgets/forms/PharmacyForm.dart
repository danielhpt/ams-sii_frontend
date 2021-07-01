import 'package:flutter/material.dart';
import 'package:project/views/forms/PharmacyFormState.dart';
import '../../models/Pharmacy.dart';

class PharmacyForm extends StatefulWidget {
  final formKey;
  final Pharmacy pharmacy;
  final bool enabled;

  PharmacyForm({Key key, this.formKey, this.pharmacy, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PharmacyFormState(
      formKey: this.formKey, pharmacy: this.pharmacy, enabled: this.enabled);
}
