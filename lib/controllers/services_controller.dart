import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServicesController extends ChangeNotifier {
  static ChangeNotifierProvider<ServicesController> get instance =>
      ChangeNotifierProvider((ref) => ServicesController());

  final String _title = "Services";
  String get title => _title;
}
