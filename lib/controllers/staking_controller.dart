import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StakingController extends ChangeNotifier {
  static ChangeNotifierProvider<StakingController> get instance =>
      ChangeNotifierProvider((ref) => StakingController());

  final String _title = "Staking";
  String get title => _title;
}
