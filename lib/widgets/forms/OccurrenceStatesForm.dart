import 'package:flutter/material.dart';
import 'package:project/views/forms/OccurrenceStatesFormState.dart';
import '../../models/OccurrenceState.dart';

class OccurrenceStatesForm extends StatefulWidget {
  final formKey;
  final OccurrenceState occurrenceState;
  final bool enabled;

  OccurrenceStatesForm(
      {Key key, this.formKey, this.occurrenceState, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => OccurrenceStatesFormState(
      occurrenceState: this.occurrenceState,
      formKey: this.formKey,
      enabled: this.enabled);
}
