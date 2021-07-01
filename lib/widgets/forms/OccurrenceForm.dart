import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/views/forms/OccurrenceFormState.dart';

class OccurrenceForm extends StatefulWidget {
  final formKey;
  final Occurrence occurrence;
  final bool enabled;

  OccurrenceForm({Key key, this.formKey, this.occurrence, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => OccurrenceFormState(
      occurrence: this.occurrence,
      formKey: this.formKey,
      enabled: this.enabled);
}
