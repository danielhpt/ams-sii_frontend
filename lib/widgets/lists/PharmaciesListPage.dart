import 'package:flutter/material.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/views/lists/PharmaciesListPageState.dart';

class PharmaciesListPage extends StatefulWidget {
  final List<Pharmacy> pharmacies;
  final bool enabled;

  PharmaciesListPage({Key key, this.pharmacies, this.enabled})
      : super(key: key);

  @override
  PharmaciesListPageState createState() => PharmaciesListPageState(
      pharmacies: pharmacies, enabled: enabled);
}
