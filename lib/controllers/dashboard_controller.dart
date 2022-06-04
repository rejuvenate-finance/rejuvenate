import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardController extends ChangeNotifier {
  static ChangeNotifierProvider<DashboardController> get instance =>
      ChangeNotifierProvider((ref) => DashboardController());

  final String _title = "Dashboard";
  String get title => _title;
}
