import 'package:app_prototype/widgets/stats/stats_vars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/individual_report.dart';
import '../date_picker.dart';

class StatsButtonsIndividual extends FormField<TimeCalculate> {
  StatsButtonsIndividual(
      {Key? key,
      TimeCalculate? initialValue,
      required ValueChanged<TimeCalculate> onChanged,
      FormFieldValidator<TimeCalculate>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              // if (constraints.minWidth > 400) {
              //   return _buildWide(formState, onChanged, context);
              // } else {
              return _buildNarrow(formState, onChanged, context);
              // }
            });
          },
        );
}

Widget _buildWide(FormFieldState<TimeCalculate> formState,
    ValueChanged<TimeCalculate>? onChanged, BuildContext context) {
  // I need a function to calculate the days to be passed into the stats calculation
  // since we need to know exaclty when the start and the end date is to do the sorting and profiling

  return Column(
    children: [
      Text("Preselected Date Range"),
      DropdownButton<TimeCalculate>(
          items: [
            DropdownMenuItem(
              value: TimeCalculate.all,
              child: Text("All Time"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastMonthToday,
              child: Text("Past Month From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastQuarterToday,
              child: Text("Past Quarter From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastHalfYearToday,
              child: Text("Past Half-Year From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastYearToday,
              child: Text("Past Year From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousMonth,
              child: Text("Previous Month"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousQuarter,
              child: Text("Previous Quarter"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousHalfYear,
              child: Text("Previous Half-Year"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousYear,
              child: Text("Previous Year"),
            ),
          ],
          onChanged: (TimeCalculate? newValue) {
            formState.didChange(newValue);

            DateTime now = DateTime.now();

            onChanged!(newValue!);
            if (newValue == TimeCalculate.all) {
              DateTime temp = context
                  .read<IndividualReport>()
                  .sortedGradeSheets[0]
                  .startTime;
              context.read<IndividualReport>().dateStart =
                  DateTime(temp.year, temp.month, temp.day - 1);

              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastMonthToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 30));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastQuarterToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 90));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastHalfYearToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 180));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastYearToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 365));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.previousMonth) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year, now.month - 1, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            } else if (newValue == TimeCalculate.previousQuarter) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year, now.month - 3, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            } else if (newValue == TimeCalculate.previousHalfYear) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year, now.month - 6, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            } else if (newValue == TimeCalculate.previousYear) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year - 1, now.month, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            }
          },
          value: formState.value),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
        child: Column(
          children: [
            const Text(
              "Grade Over Time",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: charts.TimeSeriesChart(
                context.watch<IndividualReport>().overallChart,
                defaultRenderer: new charts.BarRendererConfig<DateTime>(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildNarrow(FormFieldState<TimeCalculate> formState,
    ValueChanged<TimeCalculate>? onChanged, BuildContext context) {
  // I need a function to calculate the days to be passed into the stats calculation
  // since we need to know exaclty when the start and the end date is to do the sorting and profiling

  return Column(
    children: [
      Text("Preselected Date Range"),
      DropdownButton<TimeCalculate>(
          items: [
            DropdownMenuItem(
              value: TimeCalculate.all,
              child: Text("All Time"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastMonthToday,
              child: Text("Past Month From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastQuarterToday,
              child: Text("Past Quarter From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastHalfYearToday,
              child: Text("Past Half-Year From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.pastYearToday,
              child: Text("Past Year From Today"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousMonth,
              child: Text("Previous Month"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousQuarter,
              child: Text("Previous Quarter"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousHalfYear,
              child: Text("Previous Half-Year"),
            ),
            DropdownMenuItem(
              value: TimeCalculate.previousYear,
              child: Text("Previous Year"),
            ),
          ],
          onChanged: (TimeCalculate? newValue) {
            formState.didChange(newValue);

            DateTime now = DateTime.now();

            onChanged!(newValue!);
            if (newValue == TimeCalculate.all) {
              DateTime temp = context
                  .read<IndividualReport>()
                  .sortedGradeSheets[0]
                  .startTime;
              context.read<IndividualReport>().dateStart =
                  DateTime(temp.year, temp.month, temp.day - 1);

              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastMonthToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 30));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastQuarterToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 90));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastHalfYearToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 180));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.pastYearToday) {
              context.read<IndividualReport>().dateStart =
                  DateTime.now().subtract(Duration(days: 365));
              context.read<IndividualReport>().dateEnd = DateTime.now();
            } else if (newValue == TimeCalculate.previousMonth) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year, now.month - 1, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            } else if (newValue == TimeCalculate.previousQuarter) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year, now.month - 3, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            } else if (newValue == TimeCalculate.previousHalfYear) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year, now.month - 6, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            } else if (newValue == TimeCalculate.previousYear) {
              context.read<IndividualReport>().dateStart =
                  DateTime(now.year - 1, now.month, 0, 0, 0);
              context.read<IndividualReport>().dateEnd =
                  DateTime(now.year, now.month, 0, 0, 0);
            }
          },
          value: formState.value),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
        child: Column(
          children: [
            const Text(
              "Grade Over Time",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: charts.TimeSeriesChart(
                context.watch<IndividualReport>().overallChart,
                defaultRenderer: new charts.BarRendererConfig<DateTime>(),
              ),
            ),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Text("Trend", style: TextStyle(fontSize: 28))),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  width: 200,
                  height: 25,
                  child: Text(
                    "Grade Area",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              // this will be all of the individual grade areas

              Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 25,
                  child: Text("start",
                      style: TextStyle(fontWeight: FontWeight.bold))),

              Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 25,
                  child: Text("end",
                      style: TextStyle(fontWeight: FontWeight.bold))),

              Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 25,
                  child: Text('diff',
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
          for (String key in context.watch<IndividualReport>().firstHalf.keys)
            if (context.watch<IndividualReport>().secondHalf.containsKey(key))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 200,
                      height: 40,
                      child: Text(key)),
                  // this will be all of the individual grade areas

                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 25,
                      child: Text(context
                          .watch<IndividualReport>()
                          .firstHalf[key]![0]
                          .toStringAsPrecision(3))),

                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 25,
                      child: Text(context
                          .watch<IndividualReport>()
                          .secondHalf[key]![0]
                          .toStringAsPrecision(3))),

                  Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 25,
                      child: Text((context
                                  .watch<IndividualReport>()
                                  .secondHalf[key]![0] -
                              context
                                  .watch<IndividualReport>()
                                  .firstHalf[key]![0])
                          .toStringAsPrecision(3)))
                ],
              ),
        ]),
      ),
    ],
  );
}
