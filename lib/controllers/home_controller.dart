import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeController extends ChangeNotifier {
  static ChangeNotifierProvider<HomeController> get instance =>
      ChangeNotifierProvider((ref) => HomeController());

  final String _title = "Rejuvenate";
  String get title => _title;
}
