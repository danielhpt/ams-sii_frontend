import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/TeamTechnician.dart';
import 'package:project/models/User.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/dialogs/AddTechnicianDialog.dart';

class AddTechnicianDialogState extends State<AddTechnicianDialog> {
  final formKey = GlobalKey<FormState>();
  Team team;
  User newUser;
  int id;

  AddTechnicianDialogState({this.team});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Adicionar Técnico"),
      content: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              children: [
                if (newUser == null)
                  Form(
                    key: formKey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person_pin),
                        labelText: 'ID',
                      ),
                      onSaved: (String value) {
                        id = int.parse(value);
                      },
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String value) {
                        return (value == null ||
                                int.tryParse(value) == null ||
                                int.parse(value) < 0)
                            ? 'ID inválido'
                            : null;
                      },
                    ),
                  )
                else
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Técnico',
                          ),
                          enabled: false,
                          initialValue: newUser.getFullName(),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context, 'close'),
        ),
        if (newUser == null)
          TextButton(
            child: Text("Buscar"),
            onPressed: () async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                try {
                  User u = await getUser(id);
                  setState(() {
                    newUser = u;
                  });
                } catch (e) {
                  showToast("Técnico não encontrado");
                }
              } else {
                showToast("ID inválido");
              }
            },
          )
        else
          TextButton(
            child: Text("Adicionar"),
            onPressed: () {
              team.technicians.add(TeamTechnician.fromUser(newUser));
              Navigator.pop(context, 'add');
            },
          )
      ],
    );
  }
}
