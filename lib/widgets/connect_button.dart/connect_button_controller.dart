import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rejuvenate/app/injector.dart';
import 'package:rejuvenate/services/wallet_connect_service.dart';

class ConnectButtonController extends ChangeNotifier {
  static ChangeNotifierProvider<ConnectButtonController> get instance =>
      ChangeNotifierProvider((ref) => ConnectButtonController());

  late WalletConnectService _walletConnectService;

  ConnectButtonController() {
    _walletConnectService = injector<WalletConnectService>();
    _walletConnectService.addListener(() {
      notifyListeners();
    });
  }

  void Function()? get onPressed => _walletConnectService.isConnected
      ? null
      : () {
          _walletConnectService.connect();
        };

  String get buttonText =>
      _walletConnectService.isConnected ? "Connected" : "Connect";
}

enum ConnectionButtonState {
  connected,
  disconnect,
  unavailable,
}
