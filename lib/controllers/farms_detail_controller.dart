import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FarmsDetailController extends ChangeNotifier {
  static ChangeNotifierProvider<FarmsDetailController> get instance =>
      ChangeNotifierProvider((ref) => FarmsDetailController());

  final String _title = "Farms Detail";
  String get title => _title;
}
