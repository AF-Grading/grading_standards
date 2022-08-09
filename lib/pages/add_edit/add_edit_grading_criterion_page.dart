import 'package:app_prototype/models/grading_criterion.dart';
import 'package:app_prototype/widgets/grade_radio_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/grade_enums.dart';
import '../../models/grading_parameter.dart';
import '../../widgets/spaced_item.dart';

class AddEditGradingCriterionPage extends StatefulWidget {
  const AddEditGradingCriterionPage({Key? key, this.gradingCriterion})
      : super(key: key);

  final GradingCriterion? gradingCriterion;

  @override
  State<AddEditGradingCriterionPage> createState() =>
      _AddEditGradingCriterionPageState();
}

class _AddEditGradingCriterionPageState
    extends State<AddEditGradingCriterionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late bool _isEditing;

  late final TextEditingController _criterionName =
      TextEditingController(text: widget.gradingCriterion?.criterion);

  late final TextEditingController _standards =
      TextEditingController(text: widget.gradingCriterion?.standards);

  late final TextEditingController _performance =
      TextEditingController(text: widget.gradingCriterion?.performance);

  late final TextEditingController _id = TextEditingController(
      text: widget.gradingCriterion != null
          ? "${widget.gradingCriterion?.id}"
          : null);

  late Map<String, int> _pilotQuals;

  late Map<String, int> _adQuals;

  @override
  void initState() {
    _isEditing = widget.gradingCriterion != null ? true : false;

    if (_isEditing) {
      if (widget.gradingCriterion!.pilotQuals != null) {
        _pilotQuals = widget.gradingCriterion!.pilotQuals!;
      } else {
        _pilotQuals = {"fpc": -1, "fpq": -1, "mp": -1, "ip": -1};
      }

      if (widget.gradingCriterion!.adQuals != null) {
        _adQuals = widget.gradingCriterion!.adQuals!;
      } else {
        _adQuals = {"cpad": -1, "acad": -1, "adip": -1, "ldad": -1};
      }
    } else {
      _pilotQuals = {"fpc": -1, "fpq": -1, "mp": -1, "ip": -1};
      _adQuals = {"cpad": -1, "acad": -1, "adip": -1, "ldad": -1};
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
                ? const Text("Edit Criterion")
                : const Text("Add Criterion")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _isEditing
                  ? SpacedItem(
                      name: "Parameter",
                      child: Text(widget.gradingCriterion!.criterion))
                  : SpacedItem(
                      name: "Parameter",
                      child: TextFormField(
                        controller: _criterionName,
                        validator: (value) {
                          if (value == "") {
                            return "Please enter a name";
                          }
                          return null;
                        },
                      ),
                    ),
              SpacedItem(
                name: "id",
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _id,
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a name";
                    }
                    return null;
                  },
                ),
              ),
              SpacedItem(
                name: "Standards",
                child: TextFormField(
                  controller: _standards,
                  minLines: 3,
                  maxLines: 10,
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a name";
                    }
                    return null;
                  },
                ),
              ),
              SpacedItem(
                name: "Performance",
                child: TextFormField(
                  controller: _performance,
                  minLines: 3,
                  maxLines: 10,
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a name";
                    }
                    return null;
                  },
                ),
              ),
              const Text("Pilot Qualifications"),
              ..._pilotQuals.entries
                  .map(
                    (entry) => SpacedItem(
                      name: entry.key.toUpperCase(),
                      child: GradeRadiosFormField(
                        initialValue: entry.value.grade,
                        onChanged: (value) => setState(() {
                          _pilotQuals[entry.key] = value.index - 1;
                        }),
                      ),
                    ),
                  )
                  .toList(),
              const Text("Airdrop Qualifications"),
              ..._adQuals.entries
                  .map((entry) => SpacedItem(
                        name: entry.key.toUpperCase(),
                        child: GradeRadiosFormField(
                          initialValue: entry.value.grade,
                          onChanged: (value) => setState(() {
                            _adQuals[entry.key] = value.index - 1;
                          }),
                        ),
                      ))
                  .toList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final gradingCriterion = GradingCriterion(
                  id: int.parse(_id.text),
                  criterion: _criterionName.text,
                  standards: _standards.text,
                  performance: _performance.text,
                  pilotQuals: _pilotQuals,
                  adQuals: _adQuals);

              final List<GradingParameter> params =
                  context.read<List<GradingParameter>>();

              if (!_isEditing) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Criterion Added"),
                  ),
                );

                FirebaseFirestore.instance
                    .collection('Grading Criteria')
                    .add(gradingCriterion.toFirestore());

                //Updates all Params to include the new value

                for (GradingParameter param in params) {
                  var newParams = param.params;
                  newParams.add(Param(_criterionName.text, false));
                  final newParam = GradingParameter(
                      paramName: param.paramName, params: newParams);

                  FirebaseFirestore.instance
                      .collection('Grading Parameters')
                      .withConverter(
                          fromFirestore: GradingParameter.fromFirestore,
                          toFirestore: (GradingParameter setting, _) =>
                              setting.toFirestore())
                      .where("paramName", isEqualTo: param.paramName)
                      .get()
                      .then((value) => FirebaseFirestore.instance
                          .collection('Grading Parameters')
                          .withConverter(
                              fromFirestore: GradingParameter.fromFirestore,
                              toFirestore: (GradingParameter setting, _) =>
                                  setting.toFirestore())
                          .doc(value.docs[0].id)
                          .update(newParam.toFirestore()));
                }

                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Parameter Edited"),
                  ),
                );

                FirebaseFirestore.instance
                    .collection('Grading Criteria')
                    .withConverter(
                        fromFirestore: GradingCriterion.fromFirestore,
                        toFirestore: (GradingCriterion setting, _) =>
                            setting.toFirestore())
                    .where("criterion",
                        isEqualTo: widget.gradingCriterion!.criterion)
                    .get()
                    .then((value) => FirebaseFirestore.instance
                        .collection('Grading Criteria')
                        .withConverter(
                            fromFirestore: GradingCriterion.fromFirestore,
                            toFirestore: (GradingCriterion setting, _) =>
                                setting.toFirestore())
                        .doc(value.docs[0].id)
                        .update(gradingCriterion.toFirestore()));

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
