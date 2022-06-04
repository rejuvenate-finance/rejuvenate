import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamController extends ChangeNotifier {
  static ChangeNotifierProvider<TeamController> get instance =>
      ChangeNotifierProvider((ref) => TeamController());

  final String _title = "Team";
  String get title => _title;
}
