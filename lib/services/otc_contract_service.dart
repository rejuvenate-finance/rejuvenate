import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:rejuvenate/app/injector.dart';
import 'package:rejuvenate/app/reactive_service.dart';
import 'package:rejuvenate/services/wallet_connect_service.dart';

class OTCContractService extends ReactiveService {
  late WalletConnectService _walletConnectService;

  ContractERC20? _busdContract;
  Contract? _otcContract;

  final _allowance = ValueNotifier<BigInt>(BigInt.zero);
  BigInt get allowance => _allowance.value;

  OTCContractService() {
    registerReactiveValues([
      _allowance,
    ]);
    _walletConnectService = injector<WalletConnectService>();
    _walletConnectService.addListener(() async {
      if (_walletConnectService.isConnected == true) {
        _busdContract = ContractERC20(
          _busdAddress,
          _walletConnectService.signer,
        );
        _otcContract = Contract(
          _otcAddress,
          _otcAbi,
          _walletConnectService.signer,
        );
        _busdContract!.onApproval((owner, spender, value, event) {
          if (spender.toLowerCase() != spender.toLowerCase() ||
              owner.toLowerCase() !=
                  _walletConnectService.currentAddress.toLowerCase()) {
            return;
          }
          _allowance.value = value;
        });
        _otcContract!.on("Buy", () async {
          final result = await _busdContract!.allowance(
            _walletConnectService.currentAddress,
            _otcContract!.address,
          );
          _allowance.value = result;
        });
        final result = await _busdContract!.allowance(
          _walletConnectService.currentAddress,
          _otcContract!.address,
        );
        _allowance.value = result;
      } else {
        _busdContract = null;
        _otcContract = null;
      }
    });
  }

  Future<void> init() async {
    if (_walletConnectService.isConnected == true) {
      _busdContract = ContractERC20(
        _busdAddress,
        _walletConnectService.signer,
      );
      _otcContract = Contract(
        _otcAddress,
        _otcAbi,
        _walletConnectService.signer,
      );
      _busdContract!.onApproval((owner, spender, value, event) {
        if (spender.toLowerCase() != spender.toLowerCase() ||
            owner.toLowerCase() !=
                _walletConnectService.currentAddress.toLowerCase()) {
          return;
        }
        _allowance.value = value;
      });
      _otcContract!.on("Buy", () async {
        final result = await _busdContract!.allowance(
          _walletConnectService.currentAddress,
          _otcContract!.address,
        );
        _allowance.value = result;
      });
      final result = await _busdContract!.allowance(
        _walletConnectService.currentAddress,
        _otcContract!.address,
      );
      _allowance.value = result;
    } else {
      _busdContract = null;
      _otcContract = null;
    }
  }

  Future<BigInt> queryAllowance() async {
    if (_busdContract == null ||
        _otcContract == null ||
        !_walletConnectService.isConnected) {
      debugPrint("qr null");
      return BigInt.zero;
    }
    final result = await _busdContract!
        .allowance(_walletConnectService.currentAddress, _otcContract!.address);
    _allowance.value = result;
    debugPrint("allow $result");
    return _allowance.value;
  }

  Future<BigInt> approve(BigInt amount) async {
    if (_busdContract == null ||
        _otcContract == null ||
        !_walletConnectService.isConnected) {
      debugPrint("app null");
      return BigInt.zero;
    }
    await _busdContract!.approve(_otcContract!.address, amount);
    final result = await _busdContract!.allowance(
      _walletConnectService.currentAddress,
      _otcContract!.address,
    );
    _allowance.value = result;
    return allowance;
  }

  Future<void> buy(BigInt amount) async {
    if (_otcContract == null || !_walletConnectService.isConnected) {
      debugPrint("buy null");
      return;
    }
    await _otcContract!.send('buy', [amount]);
    _allowance.value -= amount;
  }
}

const _busdAddress = "0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56";
const _otcAddress = "0x2D9f046120a834E75D2EbE6D071887732cAf2b15";
const _otcAbi =
    '''[{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"sender_","type":"address"},{"indexed":false,"internalType":"uint256","name":"paid_","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"received_","type":"uint256"}],"name":"Buy","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"inputs":[],"name":"amIWhitelisted","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount_","type":"uint256"}],"name":"buy","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"forSaleCurrency","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"token","type":"address"}],"name":"inCaseTokensGetStuck","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"paymentCurrency","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"target_","type":"address"}],"name":"unlist","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"target_","type":"address"}],"name":"whitelist","outputs":[],"stateMutability":"nonpayable","type":"function"}]''';
