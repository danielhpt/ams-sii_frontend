import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/PharmacyPage.dart';
import 'package:project/widgets/forms/PharmacyForm.dart';

class PharmacyPageState extends State<PharmacyPage> {
  final formKey = GlobalKey<FormState>();
  final Pharmacy pharmacy;
  final bool enabled;
  final bool add;
  final int victimId;

  PharmacyPageState({this.pharmacy, this.enabled, this.add, this.victimId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SIREPH Técnicos')),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                add
                    ? 'Novo Farmaco'
                    : 'Informação do Farmaco',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            PharmacyForm(
              formKey: this.formKey,
              enabled: enabled,
              pharmacy: pharmacy,
            ),
            Visibility(
              visible: enabled,
              child: Container(
                padding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                child: ProgressButton(
                  color: Colors.green,
                  child: Text(
                    'Gravar Informação',
                    style: TextStyle(fontSize: 20),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  strokeWidth: 2,
                  onPressed: (AnimationController controller) async {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();

                      controller.forward();
                      try {
                        var s = await postVictimPharmacy(victimId, pharmacy.toJson());

                        controller.reset();
                        Navigator.pop(context, 'create');
                      } catch (e) {
                        controller.reset();
                        showToast("Erro ao Gravar Farmaco");
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
