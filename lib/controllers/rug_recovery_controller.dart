import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RugRecoveryController extends ChangeNotifier {
  static ChangeNotifierProvider<RugRecoveryController> get instance =>
      ChangeNotifierProvider((ref) => RugRecoveryController());

  final String _title = "Rug Recovery";
  String get title => _title;
}
