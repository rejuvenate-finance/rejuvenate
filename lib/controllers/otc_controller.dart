import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/injector.dart';
import 'package:rejuvenate/services/otc_contract_service.dart';

class OTCController extends ChangeNotifier {
  static ChangeNotifierProvider<OTCController> get instance =>
      ChangeNotifierProvider((ref) => OTCController());

  late OTCContractService _otcContractService;

  void refresh() {
    notifyListeners();
  }

  OTCController() {
    _otcContractService = injector<OTCContractService>();
    _otcContractService.addListener(() {
      debugPrint("called");
      notifyListeners();
    });
  }

  Future<void> init() async {
    debugPrint("init");
    await _otcContractService.init();
    await _otcContractService.queryAllowance();
    notifyListeners();
  }

  final String _title = "OTC";
  String get title => _title;

  BigInt get allowance => _otcContractService.allowance;

  Future<void> buy(String input) async {
    debugPrint("buy");
    final amount = toWei(input);
    await _otcContractService.buy(amount);
    notifyListeners();
  }

  Future<void> approve(String input) async {
    debugPrint("approve");
    final amount = toWei(input);
    await _otcContractService.approve(amount);
    notifyListeners();
  }

  BigInt toWei(String input) {
    final base = double.tryParse(input);
    if (base == null) {
      return BigInt.zero;
    }
    debugPrint(BigInt.from(base * pow(10, 18)).toString());
    return BigInt.from(base * pow(10, 18));
  }
}
