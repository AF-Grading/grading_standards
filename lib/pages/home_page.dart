import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/pages/permission_pages/instructor_view_page.dart';
import 'package:app_prototype/pages/permission_pages/student_view_page.dart';
import 'package:app_prototype/pages/permission_pages/training_shop_view_page.dart';
import 'package:app_prototype/pages/permission_pages/wing_training_view_page.dart';
import 'package:app_prototype/views/individual_reports_view.dart';
import 'package:app_prototype/pages/my_grade_sheets_page.dart';
import 'package:app_prototype/pages/reference_materials_page.dart';
import 'package:app_prototype/pages/settings_page.dart';
import 'package:app_prototype/views/new_flight_view.dart';
import 'package:app_prototype/views/training_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/CurrentUser.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() => setState(() {
          _index = _controller.index;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<CurrentUser>().permission.index ==
        Permission.wing_training.index) {
      //     Permission.student.index) {}
      return WingTrainingViewPage();
    } else if (context.read<CurrentUser>().permission.index ==
        Permission.training_shop.index) {
      return TrainingShopViewPage();
    } else if (context.read<CurrentUser>().permission.index ==
        Permission.instructor.index) {
      return InstructorViewPage();
    } else {
      return StudentViewPage();
    }
  }
}
