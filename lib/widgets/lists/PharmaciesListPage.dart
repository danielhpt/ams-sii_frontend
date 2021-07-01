import 'package:flutter/material.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/views/lists/PharmaciesListPageState.dart';

class PharmaciesListPage extends StatefulWidget {
  final bool enabled;
  final int victimId;

  PharmaciesListPage({Key key, this.enabled, this.victimId}) : super(key: key);

  @override
  PharmaciesListPageState createState() => PharmaciesListPageState(
        enabled: enabled,
        victimId: victimId,
      );
}
