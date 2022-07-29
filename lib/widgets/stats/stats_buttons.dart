import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/individual_report.dart';

class StatsButtons extends StatefulWidget {
  const StatsButtons({Key? key}) : super(key: key);

  @override
  _StatsButtonsState createState() => _StatsButtonsState();
}

class _StatsButtonsState extends State<StatsButtons> {
  @override
  Widget build(BuildContext context) {
    String? _dropdownValue = "past month today";
    return Column(
      children: [
        Text("Preselected Date Range"),
        DropdownButton(
            items: [
              DropdownMenuItem(
                value: "past month today",
                child: Text("Past Month From Today"),
              ),
              DropdownMenuItem(
                value: "past quarter",
                child: Text("Past Quarter From Today"),
              ),
              DropdownMenuItem(
                value: "past half-year",
                child: Text("Past Half-Year From Today"),
              ),
              DropdownMenuItem(
                value: "past year",
                child: Text("Past Year From Today"),
              ),
              DropdownMenuItem(
                value: "previous month",
                child: Text("Previous Month"),
              ),
              DropdownMenuItem(
                value: "previous quarter",
                child: Text("Previous Quarter"),
              ),
              DropdownMenuItem(
                value: "previous half-year",
                child: Text("Previous Half-Year"),
              ),
              DropdownMenuItem(
                value: "previous year",
                child: Text("Previous Year"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _dropdownValue = value.toString();
              });
            },
            value: _dropdownValue),
        SfDateRangePicker(
          // I need to think about the initial state of things

          // start date should be the earliest date in the database for this person
          // end date should be today

          // there should be button for preset ranges (past month, past quarter, past half year, past year)

          // there should be a button for start date, and a button for the end date.

          // start date when first open will be the earliest date in the database
          // end date when first open will be today

          selectionMode: DateRangePickerSelectionMode.range,
          // initialSelectedDate: ,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
          child: Column(
            children: [
              const Text(
                "Overall Grade Over Time",
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
}
