import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamDetailController extends ChangeNotifier {
  static ChangeNotifierProvider<TeamDetailController> get instance =>
      ChangeNotifierProvider((ref) => TeamDetailController());

  final String _title = "Team Detail";
  String get title => _title;
}
