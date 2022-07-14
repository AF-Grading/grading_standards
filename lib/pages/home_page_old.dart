import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//internal imports
import '../models/current_user.dart';
import '/models/current_flight.dart';
import '/models/grade_sheets.dart';
import 'training_shop_page.dart';
import '/utils/app_drawer.dart';
import '/utils/new_flight_buttons.dart';
import '/views/individual_reports_view.dart';
import '/views/new_flight_view.dart';
import '/views/training_shop_view.dart';
import '../views/grade_sheets_view.dart';
import '/widgets/buttons/sync_button.dart';

class HomePageOld extends StatefulWidget {
  const HomePageOld({Key? key, required this.title, required this.permission})
      : super(key: key);

  final String title;
  final int permission;

  @override
  State<HomePageOld> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOld> with TickerProviderStateMixin {
  late TabController _controller;
  int _index = 0;
  late int tabLength;

  @override
  void initState() {
    // set number of tabs based on permission
    if (widget.permission == 0) {
      tabLength = 1;
    } else if (widget.permission == 1) {
      tabLength = 3;
    } else if (widget.permission > 1) {
      tabLength = 3;
    }

    _controller = TabController(length: tabLength, vsync: this);
    _controller.addListener(() => setState(() {
          _index = _controller.index;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<CurrentFlight>().newKey,
      child: tabLength == 1
          ? Scaffold(
              appBar: AppBar(title: Text(widget.title)),
              body: const GradeSheetsView(
                isInstructor: false,
              ),
              drawer: AppDrawer(),
            )
          : Scaffold(
              appBar: AppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title),
                      const SyncButton(),
                    ]),
                bottom: widget.permission == 1
                    ? TabBar(
                        controller: _controller,
                        tabs: const [
                          Tab(text: 'New Flight'),
                          Tab(text: 'Individual Reports'),
                          Tab(text: 'Squadron View'),
                        ],
                      )
                    : TabBar(
                        controller: _controller,
                        tabs: const [
                          Tab(text: 'New Flight'),
                          Tab(text: 'Individual Reports'),
                          Tab(text: 'Training Shop'),
                        ],
                      ),
              ),
              drawer: AppDrawer(),
              body: TabBarView(
                controller: _controller,
                children: widget.permission == 1
                    ? [
                        //NewGradeSheetView(),
                        NewFlightView(),
                        const IndividualReportsView(),
                        TrainingShopPage(
                          gradeSheets: context.watch<GradeSheets>().gradeSheets,
                          squad: context.read<CurrentUser>().user.squad,
                        ),
                      ]
                    : [
                        NewFlightView(),
                        IndividualReportsView(),
                        TrainingShopView(),
                      ],
              ),
              floatingActionButton:
                  // only show buttons if on new flight tab
                  _index == 0 ? const NewFlightButtons() : null,
            ),
    );
  }
}
