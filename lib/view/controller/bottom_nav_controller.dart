
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screen/dash_bord_screen.dart';
import '../screen/location_screen.dart';
import '../screen/reports_screen.dart';


class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  final List<Widget> pages = [
    DashBordScreen(),
    const LocationScreen(),
    const ReportsScreen(),
  ];
  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
    print(selectedIndex.value);
  }
}
