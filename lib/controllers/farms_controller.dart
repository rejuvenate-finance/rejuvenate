import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FarmsController extends ChangeNotifier {
  static ChangeNotifierProvider<FarmsController> get instance =>
      ChangeNotifierProvider((ref) => FarmsController());

  final String _title = "Farms";
  String get title => _title;
}
