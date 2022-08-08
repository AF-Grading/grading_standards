import 'package:app_prototype/models/grading_criterion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/grading_parameter.dart';
import '../../widgets/spaced_item.dart';

class AddEditGradingParameterPage extends StatefulWidget {
  const AddEditGradingParameterPage(
      {Key? key, this.gradingParameter, required this.gradingCriteria})
      : super(key: key);

  final GradingParameter? gradingParameter;
  final List<GradingCriterion> gradingCriteria;

  @override
  State<AddEditGradingParameterPage> createState() =>
      _AddEditGradingParameterPageState();
}

class _AddEditGradingParameterPageState
    extends State<AddEditGradingParameterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late bool _isEditing;

  late final TextEditingController _paramName =
      TextEditingController(text: widget.gradingParameter?.paramName);

  late final Map<String, bool> _params = {
    for (GradingCriterion criterion in widget.gradingCriteria)
      criterion.criterion: false
  };

  @override
  void initState() {
    _isEditing = widget.gradingParameter != null ? true : false;

    if (_isEditing) {
      for (Param param in widget.gradingParameter!.params) {
        if (_params[param.gradingItem] != null)
          _params[param.gradingItem] = param.isUsed;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            title: _isEditing
                ? const Text("Edit Parameter")
                : const Text("Add Parameter")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SpacedItem(
                name: "Parameter",
                child: TextFormField(
                  controller: _paramName,
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a name";
                    }
                    return null;
                  },
                ),
              ),
              ..._params.entries
                  .map((entry) => ListTile(
                        leading: Checkbox(
                          value: entry.value,
                          onChanged: (value) => setState(() {
                            _params[entry.key] = value!;
                          }),
                        ),
                        title: Text(entry.key),
                      ))
                  .toList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final gradingParam = GradingParameter(
                  paramName: _paramName.text,
                  params: _params.entries
                      .map((entry) => Param(entry.key, entry.value))
                      .toList());

              if (!_isEditing) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Parameter Added"),
                  ),
                );

                FirebaseFirestore.instance
                    .collection('Grading Parameters')
                    .add(gradingParam.toFirestore());

                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Parameter Edited"),
                  ),
                );

                FirebaseFirestore.instance
                    .collection('Grading Parameters')
                    .withConverter(
                        fromFirestore: GradingParameter.fromFirestore,
                        toFirestore: (GradingParameter setting, _) =>
                            setting.toFirestore())
                    .where("paramName",
                        isEqualTo: widget.gradingParameter!.paramName)
                    .get()
                    .then((value) => FirebaseFirestore.instance
                        .collection('Grading Parameters')
                        .withConverter(
                            fromFirestore: GradingParameter.fromFirestore,
                            toFirestore: (GradingParameter setting, _) =>
                                setting.toFirestore())
                        .doc(value.docs[0].id)
                        .update(gradingParam.toFirestore()));

                Navigator.pop(context);
              }
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
