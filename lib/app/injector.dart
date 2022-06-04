import 'package:get_it/get_it.dart';
import 'package:rejuvenate/services/otc_contract_service.dart';
import 'package:rejuvenate/services/wallet_connect_service.dart';

final injector = GetIt.instance;

void setupInjector() {
  injector.registerLazySingleton(() => WalletConnectService());
  injector.registerLazySingleton(() => OTCContractService());
}
