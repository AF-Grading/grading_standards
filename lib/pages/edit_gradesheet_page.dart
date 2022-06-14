import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';

class EditGradeSheetPage extends StatefulWidget {
  const EditGradeSheetPage({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  State<EditGradeSheetPage> createState() => _EditGradeSheetPageState();
}

class _EditGradeSheetPageState extends State<EditGradeSheetPage> {
  final _formKey = GlobalKey<FormState>();
  Grade _overall = Grade.noGrade;
  AdQual _adQual = AdQual.none;
  PilotQual _pilotQual = PilotQual.fpq;
  SortieType _sortieType = SortieType.local;
  DayNight _dayNight = DayNight.day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Grade Sheet"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.gradeSheet.instructor),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      initialValue: widget.gradeSheet.student,
                      decoration: const InputDecoration(
                        labelText: "Student",
                      ),
                      onSaved: (value) => widget.gradeSheet.student = value!,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      initialValue: widget.gradeSheet.missionNum.toString(),
                      decoration: const InputDecoration(
                        labelText: "Mission Number",
                      ),
                      onSaved: (value) =>
                          widget.gradeSheet.missionNum = int.parse(value!),
                    ),
                  )
                ],
              ),

              const SizedBox(
                  height: 300, child: Center(child: Text("Grades Widget"))),
              // Should be moved to a "Grade Picker Widget of some sort for reuse"
              SizedBox(
                //width: 400,
                child: Row(
                  children: [
                    const Text("Overall Grade:"),
                    Flexible(
                      flex: 1,
                      //width: context.size. * .2,
                      child: ListTile(
                        title: const Text('No Grade'),
                        leading: Radio<Grade>(
                          value: Grade.noGrade,
                          groupValue: _overall,
                          onChanged: (Grade? value) {
                            setState(() {
                              _overall = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Unsatisfactory'),
                        leading: Radio<Grade>(
                          value: Grade.unsatisfactory,
                          groupValue: _overall,
                          onChanged: (Grade? value) {
                            setState(() {
                              _overall = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Introductory'),
                        leading: Radio<Grade>(
                          value: Grade.introductory,
                          groupValue: _overall,
                          onChanged: (Grade? value) {
                            setState(() {
                              _overall = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Familiar'),
                        leading: Radio<Grade>(
                          value: Grade.familiar,
                          groupValue: _overall,
                          onChanged: (Grade? value) {
                            setState(() {
                              _overall = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Proficient'),
                        leading: Radio<Grade>(
                          value: Grade.proficient,
                          groupValue: _overall,
                          onChanged: (Grade? value) {
                            setState(() {
                              _overall = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Expert'),
                        dense: true,
                        leading: Radio<Grade>(
                          value: Grade.expert,
                          groupValue: _overall,
                          onChanged: (Grade? value) {
                            setState(() {
                              _overall = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text("Ad Qualification:"),
                  Flexible(
                    flex: 1,
                    //width: context.size. * .2,
                    child: ListTile(
                      title: const Text('None'),
                      leading: Radio<AdQual>(
                        value: AdQual.none,
                        groupValue: _adQual,
                        onChanged: (AdQual? value) {
                          setState(() {
                            _adQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('Ldad'),
                      leading: Radio<AdQual>(
                        value: AdQual.ldad,
                        groupValue: _adQual,
                        onChanged: (AdQual? value) {
                          setState(() {
                            _adQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('Adid'),
                      leading: Radio<AdQual>(
                        value: AdQual.adid,
                        groupValue: _adQual,
                        onChanged: (AdQual? value) {
                          setState(() {
                            _adQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('Acad'),
                      leading: Radio<AdQual>(
                        value: AdQual.acad,
                        groupValue: _adQual,
                        onChanged: (AdQual? value) {
                          setState(() {
                            _adQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('Cpad'),
                      leading: Radio<AdQual>(
                        value: AdQual.cpad,
                        groupValue: _adQual,
                        onChanged: (AdQual? value) {
                          setState(() {
                            _adQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Pilot Qualification:"),
                  Flexible(
                    flex: 1,
                    //width: context.size. * .2,
                    child: ListTile(
                      title: const Text('FPQ'),
                      leading: Radio<PilotQual>(
                        value: PilotQual.fpq,
                        groupValue: _pilotQual,
                        onChanged: (PilotQual? value) {
                          setState(() {
                            _pilotQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('FPC'),
                      leading: Radio<PilotQual>(
                        value: PilotQual.fpc,
                        groupValue: _pilotQual,
                        onChanged: (PilotQual? value) {
                          setState(() {
                            _pilotQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('MP'),
                      leading: Radio<PilotQual>(
                        value: PilotQual.mp,
                        groupValue: _pilotQual,
                        onChanged: (PilotQual? value) {
                          setState(() {
                            _pilotQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('IP'),
                      leading: Radio<PilotQual>(
                        value: PilotQual.ip,
                        groupValue: _pilotQual,
                        onChanged: (PilotQual? value) {
                          setState(() {
                            _pilotQual = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                initialValue: widget.gradeSheet.weather,
                decoration: const InputDecoration(
                  labelText: "Weather",
                ),
                onSaved: (value) => widget.gradeSheet.weather = value!,
              ),
              Row(
                children: [
                  const Text("Sortie Type:"),
                  Flexible(
                    flex: 1,
                    //width: context.size. * .2,
                    child: ListTile(
                      title: const Text('Local'),
                      leading: Radio<SortieType>(
                        value: SortieType.local,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('IMS'),
                      leading: Radio<SortieType>(
                        value: SortieType.ims,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('Mission'),
                      leading: Radio<SortieType>(
                        value: SortieType.mission,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('OST'),
                      leading: Radio<SortieType>(
                        value: SortieType.ost,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('InstmtSim'),
                      leading: Radio<SortieType>(
                        value: SortieType.instmtSim,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('TacticsSim'),
                      leading: Radio<SortieType>(
                        value: SortieType.tacticsSim,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('MMP'),
                      leading: Radio<SortieType>(
                        value: SortieType.mmp,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('LFE'),
                      leading: Radio<SortieType>(
                        value: SortieType.lfe,
                        groupValue: _sortieType,
                        onChanged: (SortieType? value) {
                          setState(() {
                            _sortieType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Day/Night:"),
                  Flexible(
                    flex: 1,
                    //width: context.size. * .2,
                    child: ListTile(
                      title: const Text('Day'),
                      leading: Radio<DayNight>(
                        value: DayNight.day,
                        groupValue: _dayNight,
                        onChanged: (DayNight? value) {
                          setState(() {
                            _dayNight = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title: const Text('Night'),
                      leading: Radio<DayNight>(
                        value: DayNight.night,
                        groupValue: _dayNight,
                        onChanged: (DayNight? value) {
                          setState(() {
                            _dayNight = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Text("Date Picker"),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      initialValue: widget.gradeSheet.sortieNumber.toString(),
                      decoration: const InputDecoration(
                        labelText: "Sortie Number",
                      ),
                      onSaved: (value) =>
                          widget.gradeSheet.sortieNumber = int.parse(value!),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    // consider some sort of time picker here
                    child: TextFormField(
                      initialValue: widget.gradeSheet.length,
                      decoration: const InputDecoration(
                        labelText: "Length",
                      ),
                      onSaved: (value) => widget.gradeSheet.length = value!,
                    ),
                  ),
                ],
              ),
              TextFormField(
                initialValue: widget.gradeSheet.profile,
                decoration: const InputDecoration(
                  labelText: "Profile",
                ),
                onSaved: (value) => widget.gradeSheet.profile = value!,
              ),
              TextFormField(
                initialValue: widget.gradeSheet.overallComments,
                decoration: const InputDecoration(
                  labelText: "Overall Comments",
                ),
                onSaved: (value) => widget.gradeSheet.overallComments = value!,
              ),
              TextFormField(
                initialValue: widget.gradeSheet.recommendations,
                decoration: const InputDecoration(
                  labelText: "Recommendations",
                ),
                onSaved: (value) => widget.gradeSheet.recommendations = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
